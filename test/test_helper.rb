require "rack/test"
require "test/unit"

# Always use local Rulers first (not the one that's installed as a gem)
this_dir = File.join(File.dirname(__FILE__), "..")
$LOAD_PATH.unshift File.expand_path(this_dir)

require "rulers"
