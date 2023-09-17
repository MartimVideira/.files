from subprocess import run

workspace_bindings = [(i,i) for i in range(1,10)]
workspace_bindings.append((10,0))

dynamic_workspaces = "false"
num_workspaces = len(workspace_bindings)

def switch_to_workspace(ws,key):
  return ["gsettings", "set", "org.gnome.desktop.wm.keybindings", f"switch-to-workspace-{ws}", f"['<Super>{key}']"]

def move_to_workspace(ws,key):
  return ["gsettings", "set", "org.gnome.desktop.wm.keybindings", f"move-to-workspace-{ws}", f"['<Super><Shift>{key}']"]


run(["gsettings", "set", "org.gnome.mutter", "dynamic-workspaces",dynamic_workspaces])

run(["gsettings", "set", "org.gnome.desktop.wm.preferences", "num-workspaces", str(num_workspaces)])

for ws,key in workspace_bindings:
    run(switch_to_workspace(ws,key))
    run(move_to_workspace(ws,key))
