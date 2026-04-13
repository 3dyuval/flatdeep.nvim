-- flatdeep (default variant)
package.loaded["flatdeep"] = nil
package.loaded["flatdeep.colors"] = nil
package.loaded["flatdeep.scheme"] = nil
require("flatdeep").setup({ variant = "default" })
require("flatdeep").load()
