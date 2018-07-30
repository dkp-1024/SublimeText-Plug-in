# tools -> add new plugin

import datetime, getpass
import sublime, sublime_plugin
class AddDateCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        self.view.run_command("insert_snippet", { "contents": "%s" %  datetime.date.today().strftime("%d %B %Y (%A)") } )

class AddTimeCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        self.view.run_command("insert_snippet", { "contents": "%s" %  datetime.datetime.now().strftime("%H:%M") } )

# {"keys": ["ctrl+shift+,"], "command": "add_date" },
# {"keys": ["ctrl+shift+."], "command": "add_time" },
# you can change the key binding whenever you please

# 05 August 2017 (Saturday)21:02