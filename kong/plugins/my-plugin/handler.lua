local MyPluginHandler = {
    PRIORITY = 1000,
    VERSION = "0.0.1",
}


math.randomseed(os.time())

-- Function to generate a unique ID
function generateUniqueID()
    local template = "%s-%04x%04x-%04x-%04x-%04x-%04x%04x%04x"
    return string.format(template,
        os.date("%Y%m%d%H%M%S"), -- Date and time for uniqueness
        math.random(0, 0xffff), math.random(0, 0xffff), -- Random segments
        math.random(0, 0xffff),
        math.random(0, 0xffff),
        math.random(0, 0xffff),
        math.random(0, 0xffff), math.random(0, 0xffff), math.random(0, 0xffff)
    )
end

function MyPluginHandler:access(conf)
    kong.service.request.set_header(conf.request_header_key, generateUniqueID())
end

function MyPluginHandler:response(conf)
    kong.response.set_header(conf.response_header_key, generateUniqueID())
end
 
 
return MyPluginHandler
