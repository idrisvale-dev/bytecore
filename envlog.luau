--!nocheck

_G.AuroraCFG = _G.AuroraCFG or {}
local CFG = _G.AuroraCFG

local DISCORD_WEBHOOK = CFG.WebhookURL or ""
local CUSTOM_FOOTER   = "DevAurora | logged by DevAurora"
local CREDS_FILENAME_DISCORD = "creditals.txt"
local ENVLOG_FILENAME_DISCORD = "envlogged.txt"
local EMBED_COLOR = 16711680
local ALERT_COLOR = 16711680
local SCHEMA_VERSION = "devaurora/1"
local SESSION_ID = string.format("sess_%d_%d", math.floor(os.time()), math.random(100000, 999999))

local raw_push
local send_embed_async
local analyze_arg_drift
local obfuscation_score
local enumerate_connections_fn
local exfil_chain_window={}
local domain_rate={}
local partial_tokens={}
local aurora_upvalue_snapshots={}
local coroutine_depth_tracker={}
local last_teleport_queue_t=0
local replay = {}
local replay_idx = 1
local _running = true
local script_scores={}
local file_hashes={}
local payload_hashes={}
local remote_timing={}
local chat_flood_counts={}
local remote_recv_hooked={}
local _capability_saved={}

local function refresh_webhook()
    DISCORD_WEBHOOK = (_G.AuroraCFG and _G.AuroraCFG.WebhookURL) or ""
end

local CONFIG = {
    max_entries=32768, flush_interval=0.4, stack_depth=6,
    log_to_file=true, creds_path="creditals.txt", envlog_path="envlogged.txt",
    jsonl_path="envlog.jsonl", export_jsonl=true,
    replay_path="_replay.bin", replay_max=500, envlog_rotate_bytes=8*1024*1024,
    trace_reads=true, trace_writes=true, trace_calls=true, trace_env=true, trace_load=true,
    trace_require=true, trace_remote=true, trace_signals=true, trace_coroutine=true, trace_task=true,
    trace_rawnet=true, trace_instance=true, trace_http=true, trace_file_io=true, trace_debug=true,
    trace_closure=true, trace_player=true, trace_chat=true, trace_humanoid=true, trace_signatures=true,
    profiler_enabled=true, call_graph_enabled=true, taint_enabled=true,
    env_diff_enabled=true, env_diff_interval=2.0, rate_limit_per_s=60,
    secret_enabled=true, secret_dedupe=true, secret_min_b64_len=200, secret_min_hex_len=64,
    secret_scan_kinds={http=true, remote=true, file=true, invoke=true, load=true, require=true, chat=true, watch=true, manual=true, sig=true},
    silence_sources={"devaurora_envlog"},
    webhook_min_gap=2.1, envlog_send_gap=10.0, envlog_batch_max=200,
    webhook_retry_max=3, webhook_retry_wait=1.5,
    heartbeat_seconds=300, integrity_seconds=5,
    recon_on_load=true, player_tracking=true, chat_capture=true, anti_kick=true, script_attribution=true,
    auto_character_hooks=true, auto_descendant_spy=true, auto_drawing_spy=true, auto_gui_detector=true,
    auto_uis_input=true, auto_cas_spy=true, auto_datastore_spy=true, auto_marketplace_spy=true,
    auto_teleport_spy=true, auto_runservice_spy=true, auto_sound_spy=true, auto_animation_spy=true,
    auto_camera_spy=true, auto_lighting_spy=true, auto_clipboard_spy=true, auto_teleport_queue_spy=true,
    auto_custom_asset_spy=true, auto_network_stats=true, auto_fps_counter=true, auto_error_capture=true,
    auto_attribute_spy=true, auto_hook_sweep=true, auto_known_bad_scan=true, auto_env_snapshot=true,
    descendant_class_filter=nil,
    descendant_ignore_classes={Folder=true,Configuration=true,NumberValue=true,StringValue=true,BoolValue=true,IntValue=true,ObjectValue=true,Vector3Value=true,CFrameValue=true,Color3Value=true,RayValue=true},
    fps_sample_interval=1.0, network_sample_interval=5.0,
    decompile_on_critical=true, decompile_max_bytes=200000,
    http_decode_enabled=true, cross_script_correlation=true,
    instruction_trace=true, string_const_diff=true, upvalue_chain=true,
    http_fingerprint=true, autodecode_chain=true, autotaint=true,
    c_api_trace=true, ancestry_hash=true, memory_watch=true, console_capture=true,
    exec_fingerprint=true, remote_schema=true, self_beacon=true,
    cross_instance=true, timing_detect=true, regex_snapshot=true,
    decoy_injection=false, rotation_tracker=true, heap_sampler=true,
    replay_buffer=true, sig_of_day=true, weighted_scoring=true,
    locale_detect=true, suspend_guard=true,
    gzip_decode=true, xor_brute=true, luac_detect=true, unicode_confusable=true,
    weighted_window=60, weighted_threshold=25, alert_color=16711680,
    taint_strings_max=10000, beacon_on_stop=true,
    level="NORMAL",
    dedup=true, dedup_window=8.0,
    adaptive=true, adaptive_rate_threshold=200,
    queue_max=32768, queue_policy="drop_oldest",
    provenance_depth=6,
    causality_enabled=true, causality_stack_max=64,
    identity_enabled=true,
    state_diff_enabled=true,
    return_trace=true,
    lineage_enabled=true, lineage_max_nodes=5000,
    upvalue_graph_enabled=true, metatable_graph_enabled=true,
    schema_learning=true, coverage_enabled=true,
    anomaly_enabled=true, baseline_path="_devaurora_baseline.json", anomaly_sigma=3,
    session_autostart=true, session_export_dir="devaurora_sessions",
    redact_style="redact", redact_keep_last=4,
    integrity_hash=true, integrity_marker_path="_devaurora_integrity.txt",
    test_on_load=false,
    trace_remote_recv=true, trace_raycast=true, trace_physics=true,
    trace_inst_method=true, trace_coregui=true, trace_adornment=true,
    trace_tween=true, trace_attr_change=true, trace_appearance=true,
    trace_mouse_behavior=true, trace_text_channel=true, trace_camera_write=true,
    trace_collision=true, trace_noclip=true, trace_state_abuse=true,
    trace_remote_timing=true, trace_script_scores=true, trace_session_diff=true,
    trace_file_hash=true, trace_payload_diff=true, autosave_jsonl_interval=60,
    trace_capability_loss=true, trace_player_field=true, trace_chat_flood=true,
    chat_flood_threshold=5, physics_speed_threshold=50, physics_velocity_threshold=100,
    honeypot_enabled=true, trace_http_response=true, trace_print=true,
    trace_obfuscation=true, obfuscation_threshold=8, trace_connections=true,
    trace_mutation=true, trace_teleport_detect=true, teleport_threshold=50,
    trace_arg_drift=true,
    instant_crit_alerts=true,
    trace_exfil_chain=true, exfil_chain_window_s=0.5,
    trace_domain_reputation=true, trace_domain_flood=true,
    domain_flood_threshold=5, domain_flood_window_s=10.0,
    trace_input_inject=true, self_cloak=true,
    trace_upvalue_tamper=true,
    trace_deep_coroutine=true, coroutine_depth_threshold=5,
    trace_rejoin_kit=true, rejoin_kit_window_s=3.0,
    trace_token_reconstruct=true,
}

local CAP={}
local CAP_REASON={}
local function cap_set(name,status,reason) CAP[name]=status; if reason then CAP_REASON[name]=reason end end
local function probe()
    local names={"getrawmetatable","setreadonly","isreadonly","hookfunction","restorefunction","hookmetamethod","getnamecallmethod","newcclosure","iscclosure","islclosure","clonefunction"}
    local env=getgenv and getgenv() or _G
    for _,n in ipairs(names) do if env[n]~=nil then cap_set(n,"AVAILABLE") else cap_set(n,"UNAVAILABLE","not exposed by executor") end end
end

local reentry=0
local function entering() reentry=reentry+1 end
local function leaving() reentry=reentry-1 end
local function in_reentry() return reentry>0 end

local SEQ=0
local function next_seq() SEQ=SEQ+1; return SEQ end
local t0=os.clock()
local function mono() return os.clock()-t0 end
local function wall() return os.time()+(os.clock()%1) end

local causality={}
local function thread_key()
    local co=coroutine.running()
    return co and tostring(co) or "main"
end
local function causal_push(eid)
    if not CONFIG.causality_enabled then return end
    local k=thread_key(); local s=causality[k]; if not s then s={}; causality[k]=s end
    if #s>=CONFIG.causality_stack_max then table.remove(s,1) end
    s[#s+1]=eid
end
local function causal_pop(eid)
    local s=causality[thread_key()]; if not s then return end
    if s[#s]==eid then s[#s]=nil end
end
local function causal_parent() local s=causality[thread_key()]; return s and s[#s] or nil end
local function causal_root() local s=causality[thread_key()]; return s and s[1] or nil end
local function causal_depth() local s=causality[thread_key()]; return s and #s or 0 end

local oid_map=setmetatable({},{__mode="k"}); local oid_seq=0
local function oid(obj)
    if not CONFIG.identity_enabled or obj==nil then return nil end
    local t=typeof(obj)
    if t=="table" or t=="function" or t=="userdata" or t=="thread" or t=="Instance" then
        local v=oid_map[obj]; if v then return v end
        oid_seq=oid_seq+1; local id="o"..oid_seq; oid_map[obj]=id; return id
    end
    return nil
end
local fid_map=setmetatable({},{__mode="k"}); local fid_seq=0
local function fid(fn)
    if not CONFIG.identity_enabled or type(fn)~="function" then return nil end
    local v=fid_map[fn]; if v then return v end
    fid_seq=fid_seq+1; local id="f"..fid_seq; fid_map[fn]=id; return id
end
local tid_map=setmetatable({},{__mode="k"}); local tid_seq=0
local function tid(co)
    if co==nil then return "main" end
    if not CONFIG.identity_enabled then return "?" end
    local v=tid_map[co]; if v then return v end
    tid_seq=tid_seq+1; local id="t"..tid_seq; tid_map[co]=id; return id
end

local function redact_value(s)
    if CONFIG.redact_style=="keep" then return s end
    if type(s)~="string" or #s<8 then return s end
    if CONFIG.redact_style=="hash" then return string.format("<H:%08x>",(function() local h=5381; for i=1,#s do h=((h*33)+s:byte(i))%4294967296 end return h end)()) end
    local keep=CONFIG.redact_keep_last or 4
    if #s<=keep then return "<REDACTED>" end
    return "<REDACTED:"..#s.."b>"..s:sub(-keep)
end

local function caller_info(skip)
    skip=skip or 2
    local frames={}
    for lvl=skip,skip+CONFIG.stack_depth do
        local s,l,n=debug.info(lvl,"sln")
        if not s then break end
        local drop=false
        for _,pat in ipairs(CONFIG.silence_sources) do if s:find(pat,1,true) then drop=true; break end end
        if not drop then frames[#frames+1]={src=s,line=l or 0,fn=n or "?"} end
    end
    local top=frames[1] or {src="?",line=0,fn="?"}
    return top.src,top.line,top.fn,frames
end

local function fmt_ident(x)
    local t=typeof(x)
    if t=="Instance" then local ok,f=pcall(function() return x:GetFullName() end); return ok and f or ("Instance<"..tostring(x)..">")
    elseif t=="string" then return string.format("%q",x:sub(1,96)) end
    return tostring(x)
end

local function fmt_val(x,depth)
    depth=depth or 0
    local t=typeof(x)
    if t=="function" then local src="?"; pcall(function() src=debug.info(x,"s") or "?" end); return "<fn "..src.." "..tostring(fid(x) or "?")..">"
    elseif t=="table" then return "<table "..tostring(oid(x) or "?")..">"
    elseif t=="string" then return redact_value(x:sub(1,240))
    elseif t=="Instance" then return fmt_ident(x)
    elseif t=="userdata" then return "<udata "..tostring(oid(x) or "?")..">"
    elseif t=="thread" then return "<thread "..tostring(tid(x))..">" end
    return tostring(x)
end

local function fmt_args(packed)
    if not packed or packed.n==0 then return "()" end
    local cap=math.min(packed.n,8); local parts=table.create(cap)
    for i=1,cap do parts[i]=fmt_val(packed[i],1) end
    if packed.n>cap then parts[#parts+1]="..."..(packed.n-cap) end
    return "("..table.concat(parts,", ")..")"
end

local function json_escape(s)
    s=tostring(s)
    return (s:gsub('[%c"\\]',function(c)
        if c=='"' then return '\\"' end
        if c=='\\' then return '\\\\' end
        if c=='\n' then return '\\n' end
        if c=='\r' then return '\\r' end
        if c=='\t' then return '\\t' end
        return string.format('\\u%04x',c:byte())
    end))
end

local function simple_hash(s)
    local h=5381
    for i=1,#s do h=((h*33)+s:byte(i))%4294967296 end
    return string.format("%08x",h)
end

local function to_json(v)
    local t=type(v)
    if t=="nil" then return "null" end
    if t=="number" then return tostring(v) end
    if t=="boolean" then return v and "true" or "false" end
    if t=="string" then return '"'..v:gsub('[%c"\\]',function(c)
        if c=='"' then return '\\"' end
        if c=='\\' then return '\\\\' end
        if c=='\n' then return '\\n' end
        if c=='\r' then return '\\r' end
        if c=='\t' then return '\\t' end
        return string.format('\\u%04x',c:byte())
    end)..'"' end
    if t=="table" then
        local is_arr=true; local max=0
        for k in pairs(v) do if type(k)~="number" then is_arr=false; break end if k>max then max=k end end
        if is_arr then
            local p={}; for i=1,max do p[i]=to_json(v[i]) end
            return "["..table.concat(p,",").."]"
        end
        local p={}; for k,val in pairs(v) do p[#p+1]=to_json(tostring(k))..":"..to_json(val) end
        return "{"..table.concat(p,",").."}"
    end
    return '"<unsupported:'..t..'>"'
end

local filters={allow_source={},deny_source={},deny_key={},deny_target={},deny_kind={}}
local function passes_filters(kind,src,target,key)
    for _,p in ipairs(filters.deny_kind) do if kind==p then return false end end
    if #filters.allow_source>0 then
        local ok=false
        for _,p in ipairs(filters.allow_source) do if src and src:find(p,1,true) then ok=true; break end end
        if not ok then return false end
    end
    for _,p in ipairs(filters.deny_source) do if src and src:find(p,1,true) then return false end end
    if key~=nil then
        local ks=tostring(key)
        for _,p in ipairs(filters.deny_key) do if ks:find(p,1,true) then return false end end
    end
    if target~=nil then
        local tn=fmt_ident(target)
        for _,p in ipairs(filters.deny_target) do if tn:find(p,1,true) then return false end end
    end
    return true
end

local rate_buckets={}
local function rate_ok(src,key)
    local now=mono(); local b=src.."|"..tostring(key or "?"); local r=rate_buckets[b]
    if not r or now-r.start>=1 then rate_buckets[b]={start=now,n=1}; return true end
    r.n=r.n+1; return r.n<=CONFIG.rate_limit_per_s
end

local bus={queue={},dropped=0,sampled=0,total_in=0,total_out=0,dedup_map={},
    perf={process_time_total=0,process_time_max=0,peak_queue=0,flush_count=0}}

local level_rank={MINIMAL=1,NORMAL=2,DETAILED=3,TRACE=4}
local function level_allows(kind)
    local r=level_rank[CONFIG.level] or 2
    if r==1 then return kind=="secret" or kind=="error" or kind=="known_bad" or kind=="http" or kind=="beacon" end
    if r==2 then return kind~="read" and kind~="write" and kind~="descendant" and kind~="gui" end
    if r==3 then return kind~="descendant" end
    return true
end

local function shape_hash(ev)
    local keys={}
    for k in pairs(ev.data or {}) do keys[#keys+1]=tostring(k) end
    table.sort(keys)
    return simple_hash((ev.kind or "?").."|"..(ev.src and ev.src.script or "?").."|"..(ev.src and ev.src.fn or "?").."|"..table.concat(keys,","))
end

local function dedup_consider(ev)
    if not CONFIG.dedup then return ev end
    local h=shape_hash(ev); local rec=bus.dedup_map[h]
    if rec and (ev.t-rec.first_t)<CONFIG.dedup_window then rec.count=rec.count+1; rec.last_t=ev.t; return nil end
    bus.dedup_map[h]={count=1,first_t=ev.t,last_t=ev.t,eid=ev.eid}
    ev.dedup_h=h
    return ev
end

local function adaptive_allow(ev)
    if not CONFIG.adaptive then return true end
    local rate=bus.total_in/math.max(mono(),0.001)
    if rate>CONFIG.adaptive_rate_threshold then
        local low={read=true,write=true,call=true,descendant=true}
        if low[ev.kind] then bus.sampled=bus.sampled+1; return false end
    end
    return true
end

local function enqueue(ev)
    bus.total_in=bus.total_in+1
    if not adaptive_allow(ev) then return end
    ev=dedup_consider(ev)
    if not ev then return end
    local q=bus.queue
    if #q>=CONFIG.queue_max then
        if CONFIG.queue_policy=="drop_oldest" then table.remove(q,1); bus.dropped=bus.dropped+1
        elseif CONFIG.queue_policy=="drop_newest" then bus.dropped=bus.dropped+1; return end
    end
    q[#q+1]=ev
    if #q>bus.perf.peak_queue then bus.perf.peak_queue=#q end
end

local graph={nodes={},edges={}}
local function graph_add_node(id,type_,label)
    if not id then return end
    local n=graph.nodes[id]
    if not n then graph.nodes[id]={type=type_,label=label,first_t=mono(),count=1}
    else n.count=n.count+1 end
end
local function graph_add_edge(a,b,kind)
    if not a or not b then return end
    local k=a.."->"..b; local e=graph.edges[k]
    if not e then graph.edges[k]={count=1,kinds={[kind]=1},first_t=mono(),last_t=mono()}
    else e.count=e.count+1; e.kinds[kind]=(e.kinds[kind] or 0)+1; e.last_t=mono() end
end

local func_life={}
local return_log={}
local function trace_return(call_eid,...)
    if not CONFIG.return_trace then return end
    local n=select("#",...)
    local vals={}
    for i=1,math.min(n,6) do vals[i]=fmt_val((select(i,...)),1) end
    local sig={}
    for i=1,math.min(n,6) do local t=typeof((select(i,...))); sig[i]=t end
    return_log[call_eid]={n=n,sig=table.concat(sig,","),sample=vals}
end

local upvalue_graph={}
local function snapshot_upvalues(fn)
    if not CONFIG.upvalue_graph_enabled or type(fn)~="function" then return nil end
    local id=fid(fn); if not id then return nil end
    local ups={}
    if debug.getupvalues then
        local ok,list=pcall(debug.getupvalues,fn)
        if ok and list then for i,v in ipairs(list) do ups[i]={i=i,type=typeof(v),val_oid=oid(v)} end end
    end
    upvalue_graph[id]=upvalue_graph[id] or {id=id,snapshots={}}
    upvalue_graph[id].snapshots[#upvalue_graph[id].snapshots+1]={t=mono(),ups=ups}
    if #upvalue_graph[id].snapshots>8 then table.remove(upvalue_graph[id].snapshots,1) end
    return ups
end

local mt_graph={}

local lineage={nodes={},order={},max=CONFIG.lineage_max_nodes}
local function lineage_hash(v)
    if type(v)~="string" then return nil end
    local h=5381
    for i=1,#v do h=((h*33)+v:byte(i))%4294967296 end
    return string.format("%08x",h)
end
local function lineage_touch(v,role,eid,extra)
    if not CONFIG.lineage_enabled then return end
    if type(v)~="string" or #v<6 then return end
    local h=lineage_hash(v); if not h then return end
    local n=lineage.nodes[h]
    if not n then
        if #lineage.order>=lineage.max then local old=table.remove(lineage.order,1); lineage.nodes[old]=nil end
        n={hash=h,preview=redact_value(v:sub(1,64)),roles={},events={}}
        lineage.nodes[h]=n; lineage.order[#lineage.order+1]=h
    end
    n.roles[role]=(n.roles[role] or 0)+1
    if #n.events<32 then n.events[#n.events+1]={eid=eid,role=role,extra=extra} end
end

local schemas={}
local function schema_observe(ev)
    if not CONFIG.schema_learning then return end
    local key=(ev.kind or "?")..":"..(ev.cat or "?")
    local s=schemas[key]
    if not s then s={key=key,n=0,keys={},sigs={}}; schemas[key]=s end
    s.n=s.n+1
    for k in pairs(ev.data or {}) do s.keys[tostring(k)]=(s.keys[tostring(k)] or 0)+1 end
    local sig=""
    for k,v in pairs(ev.data or {}) do sig=sig..k..":"..typeof(v).."," end
    s.sigs[sig]=(s.sigs[sig] or 0)+1
end

local coverage={kinds={},scripts={},apis={},categories={}}
local function coverage_hit(ev)
    if not CONFIG.coverage_enabled then return end
    coverage.kinds[ev.kind]=(coverage.kinds[ev.kind] or 0)+1
    coverage.categories[ev.cat]=(coverage.categories[ev.cat] or 0)+1
    if ev.src and ev.src.script and ev.src.script~="?" then coverage.scripts[ev.src.script]=(coverage.scripts[ev.src.script] or 0)+1 end
    if ev.data and ev.data.op then coverage.apis[ev.data.op]=(coverage.apis[ev.data.op] or 0)+1 end
end

local PATTERNS={
    {name="discord_webhook",re="https?://[%w%-%.]*discord[%w%-%.]*%.com/api/webhooks/%d+/[%w%-_]+",sev="CRIT"},
    {name="discord_bot_token",re="[MN][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z[...]
    {name="roblox_cookie",re="_|WARNING:%-DO%-NOT%-SHARE%-THIS[%w%-_%./=]+",sev="CRIT"},
    {name="roblox_cookie_alt",re="%.ROBLOSECURITY=([%w%-_%./=]+)",sev="CRIT"},
    {name="bearer_token",re="[Bb]earer%s+[A-Za-z%d%-%._~+/]+=*",sev="HIGH"},
    {name="jwt",re="eyJ[A-Za-z%d_%-]+%.eyJ[A-Za-z%d_%-]+%.[A-Za-z%d_%-]+",sev="HIGH"},
}
local SECRETS={seen={},hits=0}

-- SAFE FILE I/O INITIALIZATION
-- Check if io library is available before using it
local creds_handle = nil
local has_io = io ~= nil
if has_io then
    local ok, f = pcall(function() return io.open(CONFIG.creds_path, "a") end)
    if ok and f then creds_handle = f end
end

local envlog_handle, envlog_bytes = nil, 0
local function open_envlog()
    if not has_io then return end
    local ok, f = pcall(function() return io.open(CONFIG.envlog_path, "a") end)
    if ok and f then 
        envlog_handle = f
        local sz = f:seek("end")
        envlog_bytes = sz or 0
    end
end
open_envlog()

local jsonl_handle = nil
if CONFIG.export_jsonl and has_io then
    local ok, f = pcall(function() return io.open(CONFIG.jsonl_path, "a") end)
    if ok and f then jsonl_handle = f end
end

local creds_queue={}; local envlog_queue={}
local last_creds_send=0; local last_envlog_send=0; local webhook_rotor=0

local function http_request_fn()
    local env=getgenv and getgenv() or _G
    return (env.syn and env.syn.request) or env.http_request or env.request or (syn and syn.request) or http_request or request
end
local function next_webhook()
    refresh_webhook()
    if DISCORD_WEBHOOK and DISCORD_WEBHOOK~="" then return DISCORD_WEBHOOK end
    return nil
end
local function http_post_raw(url,body,ct)
    local req=http_request_fn(); if not req then return false,"no http function" end
    local ok,res=pcall(req,{Url=url,Method="POST",Headers={["Content-Type"]=ct},Body=body})
    if not ok then return false,tostring(res) end
    if type(res)=="table" then
        local code=res.StatusCode or res.status or res.Status
        if code and (code<200 or code>=300) then return false,string.format("HTTP %s %s",tostring(code),tostring(res.Body or res.body or "")) end
    end
    return true,nil
end
local function post_multipart_file(payload_json,filename,file_content)
    local url=next_webhook(); if not url then return false,"no webhook configured" end
    local boundary="----devaurora"..tostring(math.random(100000000,999999999))..tostring(math.floor(os.clock()*1000))
    local crlf="\r\n"
    local parts={}
    parts[#parts+1]="--"..boundary..crlf
    parts[#parts+1]='Content-Disposition: form-data; name="payload_json"'..crlf
    parts[#parts+1]="Content-Type: application/json"..crlf
    parts[#parts+1]=crlf; parts[#parts+1]=payload_json..crlf
    parts[#parts+1]="--"..boundary..crlf
    parts[#parts+1]='Content-Disposition: form-data; name="files[0]"; filename="'..filename..'"'..crlf
    parts[#parts+1]="Content-Type: text/plain"..crlf
    parts[#parts+1]=crlf; parts[#parts+1]=file_content..crlf
    parts[#parts+1]="--"..boundary.."--"..crlf
    local body=table.concat(parts); local ct="multipart/form-data; boundary="..boundary
    local attempt=0
    while attempt<CONFIG.webhook_retry_max do
        attempt=attempt+1
        local ok,err=http_post_raw(url,body,ct)
        if ok then return true,nil end
        if err and (err:find("429") or err:find("5%d%d")) then task.wait(CONFIG.webhook_retry_wait*attempt) else return false,err end
    end
    return false,"retry exhausted"
end
local function post_json_with_retry(body)
    local url=next_webhook(); if not url then return false,"no webhook configured" end
    local attempt=0
    while attempt<CONFIG.webhook_retry_max do
        attempt=attempt+1
        local ok,err=http_post_raw(url,body,"application/json")
        if ok then return true,nil end
        if err and (err:find("429") or err:find("5%d%d")) then task.wait(CONFIG.webhook_retry_wait*attempt) else return false,err end
    end
    return false,"retry exhausted"
end

-- MISSING FUNCTION IMPLEMENTATIONS
local function write_envlog_line(kind, data)
    if not envlog_handle then return end
    local line = string.format("[%s] %s: %s\n", os.date("%Y-%m-%d %H:%M:%S"), kind, to_json(data or {}))
    pcall(function() envlog_handle:write(line); envlog_handle:flush() end)
end

local function flush_envlog_queue(force)
    if not CONFIG.log_to_file or #envlog_queue == 0 then return end
    if not force and (mono() - last_envlog_send) < CONFIG.envlog_send_gap then return end
    
    for _, entry in ipairs(envlog_queue) do
        write_envlog_line(entry.kind, entry.payload)
    end
    envlog_queue = {}
    last_envlog_send = mono()
end

local function scan_string(s, ctx)
    if type(s) ~= "string" or #s < 8 then return end
    for _, pattern in ipairs(PATTERNS) do
        if s:match(pattern.re) then
            SECRETS.hits = SECRETS.hits + 1
            local eid = SESSION_ID .. ":cred_" .. SECRETS.hits
            log_event("secret", {
                pattern = pattern.name,
                value = redact_value(s:sub(1, 120)),
                sev = pattern.sev,
                src = ctx.src or "?",
                line = ctx.line or 0,
                fn = ctx.fn or "?"
            })
            break
        end
    end
end

local function scan_table(t, ctx, depth)
    if depth > 3 or type(t) ~= "table" then return end
    for k, v in pairs(t) do
        if type(v) == "string" then
            scan_string(v, ctx)
        elseif type(v) == "table" then
            scan_table(v, ctx, depth + 1)
        end
    end
end

local function send_embed(title, fields, desc, color)
    local url = next_webhook()
    if not url then return false end
    
    local embed = {
        title = title,
        description = desc or "",
        color = color or EMBED_COLOR,
        footer = {text = CUSTOM_FOOTER},
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        fields = fields or {}
    }
    
    local payload = to_json({embeds = {embed}})
    return post_json_with_retry(payload)
end

local function run_signatures(kind, data)
    -- Stub implementation: can be expanded for signature checking
    return
end

local SEV_RANK={CRIT=4,HIGH=3,MED=2,LOW=1,INFO=0}
local function worst_sev(batch)
    local w="LOW"; for _,s in ipairs(batch) do if (SEV_RANK[s.sev] or 0)>(SEV_RANK[w] or 0) then w=s.sev end end; return w
end
local function count_patterns(batch)
    local by={}; for _,s in ipairs(batch) do local k=s.pattern or "?"; by[k]=(by[k] or 0)+1 end
    local list={}; for k,v in pairs(by) do list[#list+1]={k=k,v=v} end
    table.sort(list,function(a,b) return a.v>b.v end)
    local top={}; for i=1,math.min(5,#list) do top[#top+1]=string.format("%s (%d)",list[i].k,list[i].v) end
    return table.concat(top,", ")
end

local function url_decode(s) return (s:gsub("%%(%x%x)",function(h) return string.char(tonumber(h,16)) end)) end
local function hex_decode(s) if #s%2~=0 then return s end return (s:gsub("%x%x",function(h) return string.char(tonumber(h,16)) end)) end
local function b64_decode(s)
    local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    s=s:gsub("[^"..b:gsub("%-","%%-").."=]","")
    local out={}; local i=1
    while i<=#s do
        local c1=b:find(s:sub(i,i),1,true) or 0; local c2=b:find(s:sub(i+1,i+1),1,true) or 0
        local c3=b:find(s:sub(i+2,i+2),1,true) or 0; local c4=b:find(s:sub(i+3,i+3),1,true) or 0
        local n=c1*262144+c2*4096+c3*64+c4
        out[#out+1]=string.char(math.floor(n/65536)%256); out[#out+1]=string.char(math.floor(n/256)%256); out[#out+1]=string.char(n%256)
        i=i+4
    end
    return table.concat(out)
end

local score_window={}
local function score_event(kind,sev)
    if not CONFIG.weighted_scoring then return end
    local now=mono()
    local base={secret=10,remote=2,http=5,file=5,closure=8,debug=3,known_bad=15,sig=4}
    local s=(base[kind] or 1)*((SEV_RANK[sev] or 1)+1)
    score_window[#score_window+1]={t=now,score=s}
    local cut=now-CONFIG.weighted_window
    while #score_window>0 and score_window[1].t<cut do table.remove(score_window,1) end
    local sum=0; for _,e in ipairs(score_window) do sum=sum+e.score end
    if sum>=CONFIG.weighted_threshold then
        send_embed_async("Critical Activity",{
            {name="Weighted Score",value=tostring(sum),inline=true},
            {name="Window",value=CONFIG.weighted_window.."s",inline=true},
            {name="Session",value=SESSION_ID,inline=true},
        },"threshold exceeded",CONFIG.alert_color)
        score_window={}
    end
end

local http_fingerprints={}
local function fingerprint_http(url,body,ctx)
    if not CONFIG.http_fingerprint then return end
    local h=simple_hash((url or "?").."|"..tostring(body or ""))
    local prev=http_fingerprints[h]
    if not prev then http_fingerprints[h]={url=url,body_len=#tostring(body or ""),count=1,first=mono()}
    else
        prev.count=prev.count+1
        if prev.url~=url then raw_push("fingerprint",{op="url_rotated",old=prev.url,new=url,count=prev.count,src=ctx.src or "?"}) end
    end
end

local cred_lineage={}
local function track_lineage(pattern,value,src)
    if not CONFIG.rotation_tracker then return end
    local key=pattern.."|"..simple_hash(value)
    if not cred_lineage[key] then cred_lineage[key]={srcs={},count=0} end
    local L=cred_lineage[key]; L.count=L.count+1
    if src then L.srcs[src]=(L.srcs[src] or 0)+1 end
    local distinct=0; for _ in pairs(L.srcs) do distinct=distinct+1 end
    if distinct>=2 then raw_push("lineage",{op="shared_cred",pattern=pattern,distinct_srcs=distinct,count=L.count}) end
end

local remote_schemas={}
local function learn_remote(target,method,args)
    if not CONFIG.remote_schema then return end
    local key=fmt_ident(target)..":"..method
    local sig={}
    for i=1,math.min(args.n or 0,6) do local t=type(args[i]); if t=="table" and typeof(args[i])=="Instance" then t="Instance" end; sig[#sig+1]=t end
    local sigstr=table.concat(sig,",")
    local s=remote_schemas[key]
    if not s then remote_schemas[key]={base=sigstr,count=1,anomalies=0,base_count=args.n or 0}
    else
        s.count=s.count+1
        if s.count>20 and s.base~=sigstr then
            s.anomalies=s.anomalies+1
            raw_push("schema",{op="remote_anomaly",remote=key,expected=s.base,got=sigstr,count=s.count})
        end
        local new_ac=args.n or 0
        if s.count>10 and math.abs(new_ac-(s.base_count or 0))>1 then
            raw_push("remote_schema_anomaly",{op="arg_count_mismatch",remote=key,expected=s.base_count,got=new_ac,count=s.count})
        end
    end
    if analyze_arg_drift then pcall(analyze_arg_drift,key,args) end
end

local function make_event(kind,cat,data,src,line,fn,frames)
    local eid=SESSION_ID..":seq_"..next_seq()
    return {v=SCHEMA_VERSION,eid=eid,session=SESSION_ID,t=mono(),wall=wall(),kind=kind,cat=cat or "unknown",
        src={script=src or "?",fn=fn or "?",line=line or 0},frames=frames or {},
        prov={class="OBSERVED",depth=causal_depth(),thread=tid(coroutine.running())},
        parent=causal_parent(),root=causal_root(),data=data or {}}
end

local function log_event(kind,data)
    if in_reentry() then return nil end
    local src,line,fn,frames=caller_info(4)
    if data and data.src then src=data.src end
    if data and data.line then line=data.line end
    if data and data.fn then fn=data.fn end
    if not level_allows(kind) then return nil end

    local cat = data and data.cat
    if not cat then
        if kind=="secret" then cat="SECURITY"
        elseif kind=="http" or kind=="network" then cat="NETWORK"
        elseif kind=="file" or kind=="clipboard" or kind=="custom_asset" then cat="FILESYSTEM"
        elseif kind=="read" or kind=="write" or kind=="attribute" or kind=="lighting" or kind=="camera" then cat="PROPERTY"
        elseif kind=="call" or kind=="invoke" or kind=="closure" then cat="METHOD"
        elseif kind=="remote" or kind=="signal" or kind=="chat" or kind=="player" or kind=="sound" or kind=="animation" or kind=="input" or kind=="gui" then cat="EVENT"
        elseif kind=="task" or kind=="coroutine" or kind=="teleport_queue" then cat="TASK"
        elseif kind=="error" then cat="ERROR"
        elseif kind=="diff" or kind=="state_diff" or kind=="env_snapshot" then cat="STATE"
        else cat="ENV" end
    end

    local ev=make_event(kind,cat,data,src,line,fn,frames)
    enqueue(ev)

    if jsonl_handle then pcall(function() jsonl_handle:write(to_json(ev),"\n"); jsonl_handle:flush() end) end

    if kind~="secret" then
        write_envlog_line(kind,data)
        envlog_queue[#envlog_queue+1]={kind=kind,payload=data,t=mono()}
        if #envlog_queue>=CONFIG.envlog_batch_max then flush_envlog_queue(true) end
    end

    if CONFIG.secret_enabled and CONFIG.secret_scan_kinds[kind] and data then
        pcall(function()
            local ctx={kind=kind,src=src,line=line,fn=fn}
            for k,v in pairs(data) do
                if k=="frames" then for _,f in ipairs(v) do scan_string(f.src or "",ctx) end
                elseif type(v)=="string" then scan_string(v,ctx)
                elseif type(v)=="table" then scan_table(v,ctx,0) end
            end
        end)
    end

    local src_node="script:"..(src or "?")..":"..(fn or "?")
    graph_add_node(src_node,"function",fn)
    if data and data.target then
        local target_id=oid(data.target) or "?"
        graph_add_node("obj:"..target_id,"object",tostring(data.target))
        graph_add_edge(src_node,"obj:"..target_id,kind)
    end
    if data and data.op then
        graph_add_node("api:"..tostring(data.op),"api",tostring(data.op))
        graph_add_edge(src_node,"api:"..tostring(data.op),kind)
    end

    if CONFIG.lineage_enabled and data then
        for k,v in pairs(data) do if type(v)=="string" then lineage_touch(v,k,ev.eid) end end
    end

    pcall(schema_observe,ev)
    pcall(coverage_hit,ev)
    pcall(run_signatures,kind,data)
    
    return ev
end

raw_push = function(kind,data) log_event(kind,data) end

send_embed_async = function(title,fields,desc,color)
    task.spawn(function() pcall(send_embed,title,fields,desc,color) end)
end

-- Stub implementations for missing functions
function capture_executor_fingerprint()
    -- Stub: Can be expanded later
end

function install_honeypot()
    -- Stub: Can be expanded later
end

function install_print_capture()
    -- Stub: Can be expanded later
end

function install_mutation_detector()
    -- Stub: Can be expanded later
end

-- Initialize
probe()

print("[envlog] Script initialized successfully")
print("[envlog] Session ID: " .. SESSION_ID)
print("[envlog] File I/O available: " .. tostring(has_io))
