class project
  constructor: (@name) ->
    self = this
    self._storage ?= {}
    if self._storage is undefined or self._storage?
      self.name ?= "Project Processor" if not @name and @name?
      self.desc ?= "#{@name} handles processing of jRPGE project files."
    self
  process: (@project, @callback) ->
    $.ajax(
      url: "/assets/projects/" + @project.toLowerCase() + "/project.json"
      dataType: "json"
    ).done (data) ->
      callback data
      return
    return
  inputMapping: (@mapping, @io) ->
    for device, map of @mapping
      if @io[device] isnt undefined
        console.log "Device: " + device
        for action, key of map
          if @io[device].bindKey isnt undefined
            @io[device].bindKey(key, action)
          continue
        continue
    # if @mapping.keyboard
      # oRPG.io.keyboard.bindKey(65, "sampleAction");
    return
module.exports = project