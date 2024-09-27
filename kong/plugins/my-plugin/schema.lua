local typedefs = require "kong.db.schema.typedefs"

local PLUGIN_NAME = "my-plugin"

local schema = {
    name = PLUGIN_NAME,
    fields = {
        {
            config = {
                type = "record",
                fields = {
                    {
                        response_header_key = typedefs.header_name {
                            required = false,
                            default = "unique-id"
                        }
                    },
                    {
                        request_header_key = typedefs.header_name {
                            required = false,
                            default = "unique-id"
                        }
                    }
                }
            }
        }
    }
}

return schema
