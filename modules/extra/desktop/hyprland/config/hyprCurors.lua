-- hypr-dynamic-cursors
hl.config({
    plugin = {
        dynamic_cursors = {
            enabled = true,
            mode = "tilt",
            shake = {
                enabled = true,
                threshold = 20.0,
                base = 4.0,
                speed = 4.0,
                influence = 0.0,
                limit = 0.0,
                timeout = 2000,
                effects = false,
                ipc = false,
            },
            hyprcursor = {
                nearest = false,
                enabled = true,
                resolution = -1,
                fallback = "clientside"
            }
        }
    }
})

-- apply a 90° offset in rotate mode to the text shape
hl.plugin.dynamic_cursors.shape_rule { shape = "text", rotate = { offset = 90.0 } }
-- use stretch mode when grabbing, and set the limit low
hl.plugin.dynamic_cursors.shape_rule { shape = "grab", mode = "stretch", stretch = { limit = 2000 } }
-- do not show any effects on clientside cursors
hl.plugin.dynamic_cursors.shape_rule { shape = "clientside", mode = "none" }
