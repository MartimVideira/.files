import subprocess
import json
import random
from time import sleep

def random_string():
    token =[i for i in "abcdefghijklmniop"]
    random.shuffle(token)
    return "".join(token)


def open_google_on_profile(profile,url=" "):
    if url =="":
        url = "--restore-last-session"
    command = f'google-chrome --new-window --profile-directory="{profile}" {url} &'
    print(command)
    subprocess.run(command, shell=True)


def change_window_instance(new_instance_name, classname):
    subprocess.run(f"xdotool search  --sync --onlyvisible --classname {classname} set_window --classname {new_instance_name}",shell=True)


# chrome://version/

# xdotool allows us to change instance name
# xdotool search  --sync --classname [classname] set_window --classname [new class name]

def move_window(instance_name,workspace):
    subprocess.run(f'i3-msg [instance="{instance_name}"] move to workspace {workspace}',shell=True)

if __name__ == "__main__":
    with open("/home/martim/.config/i3/scripts/chrome.json","r") as options:
        obj = json.loads(options.read())
        
        for tag,el in obj.items():
            for page in el["pages"]:
                # Create RandomId
                newtag = tag + random_string()
                urls = " ".join(page.get("urls",[]))
                open_google_on_profile(el["profile"],urls)
                change_window_instance(newtag,"Google-chrome")
                move_window(newtag,page["workspace"])
