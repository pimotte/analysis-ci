
import VersoBlog
import AnalysisBook.Home

import AnalysisBook.Section_2_1
import AnalysisBook.Section_2_2
import AnalysisBook.Section_2_3
import AnalysisBook.Section_2_e
import AnalysisBook.Section_3_1
import AnalysisBook.Section_4_1
import AnalysisBook.Section_4_2
import AnalysisBook.Section_4_3
import AnalysisBook.Section_5_1
import AnalysisBook.Section_5_2
import AnalysisBook.Section_5_3
import AnalysisBook.Section_5_4
import AnalysisBook.Section_5_5
import AnalysisBook.Section_5_e

open Verso Genre Blog Site Syntax

open Output Html Template Theme in
def theme : Theme := { Theme.default with
  primaryTemplate := do
    return {{
      <html>
        <head>
          <meta charset="UTF-8"/>
          <title>{{ (← param (α := String) "title") }} " — Verso "</title>
          <link rel="stylesheet" href="/static/style.css"/>
          <script>"window.__versoSiteRoot=\"/analysis/\""</script>
          {{← builtinHeader }}
        </head>
        <body>
          <header>
            <div class="inner-wrap">

            <nav class="top" role="navigation">
              <ol>
                <li><a href="/">"Home"</a></li>
                <li><a href="/docs/">"Documentation"</a></li>
                {{ ← dirLinks (← read).site }}
              </ol>
            </nav>
          </div>
          </header>
          <div class="main" role="main">
            <div class="wrap">
              {{ (← param "content") }}
            </div>
          </div>
        </body>
      </html>
    }}
  }
  |>.override #[] ⟨do return {{<div class="frontpage"><h1>{{← param "title"}}</h1> {{← param "content"}}</div>}}, id⟩






def demoSite : Site := site AnalysisBook.Home /
  static "static" ← "./static_files"
  "sec21" sec21
  "sec22" sec22
  "sec23" sec23
  "sec2e" sec2e
  "sec31" sec31
  "sec41" sec41
  "sec42" sec42
  "sec43" sec43
  "sec51" sec51
  "sec52" sec52
  "sec53" sec53
  "sec54" sec54
  "sec55" sec55
  "sec5e" sec5e


def main := blogMain theme demoSite
