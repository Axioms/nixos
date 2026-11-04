-- hypr-dynamic-cursors
if hl.plugin.dynamic_cursors ~= nil then
    hl.config({
        plugin = {
            dynamic_cursors = {
                enabled = true,
                mode = "tilt",
                tilt = {
                     limit = 5000,
                     activation = "negative_quadratic",
                     window = 100,
                     full = 60,
                 },
                 stretch = {
                     limit = 3000,
                     activation = "quadratic",
                     window = 100,
                 },
                shake = {
                    enabled = true,
                    threshold = 6.0,
                    base = 4.0,
                    speed = 4.0,
                    influence = 0.0,
                    limit = 0.0,
                    timeout = 2000,
                    effects = true,
                    ipc = false,
                },
                rotate = {
                    length = 20,
                    offset = 0.0,
                },
                hyprcursor = {
                    nearest = false,
                    enabled = true,
                    resolution = -1,
                    fallback = "default"
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
end
