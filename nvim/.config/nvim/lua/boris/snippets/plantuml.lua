local ls = require("luasnip")
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node

return {
  plantuml = {
    snip({
      trig = "Cont",
      name = "C4 Container",
    }, {
      -- Container(act_adapter, "Activities Adapter", "Go", "Indexa las activities a partir de estimulos")
      text("Container("),
      insert(1, "container_namer"),
      text(", "),
      insert(2, "label"),
      text(", "),
      insert(3, "tech"),
      text(", "),
      insert(4, "desc"),
      text(")"),
    }),
    snip({
      trig = "SysB",
      name = "C4 System Boundary",
    }, {
      text("System_Boundary("),
      insert(1, "alias"),
      text(", "),
      insert(2, "label"),
      text({ ") {", "\t" }),
      insert(0),
      text({ "", "}" }),
    }),
    snip({
      trig = "Boun",
      name = "C4 Boundary",
    }, {
      text("Boundary("),
      insert(1, "alias"),
      text(", "),
      insert(2, "label"),
      text({ ") {", "\t" }),
      insert(0),
      text({ "", "}" }),
    }),
    snip({
      trig = "Syst",
      name = "C4 System",
    }, {
      text("System("),
      insert(1, "alias"),
      text(", "),
      insert(2, "label"),
      text({ ") {", "\t" }),
      insert(0),
      text({ "", "}" }),
    }),
    snip({
      trig = "SysE",
      name = "C4 System Ext",
    }, {
      text("System_Ext("),
      insert(1, "alias"),
      text(", "),
      insert(2, "label"),
      text(")"),
    }),
    snip({
      trig = "Rel",
      name = "C4 Rel",
    }, {
      text("Rel("),
      insert(1, "from"),
      text(", "),
      insert(2, "to"),
      text(', "'),
      insert(3, "label"),
      text('", "'),
      insert(4, "tech"),
      text('", "'),
      insert(5, ""),
      text('")'),
      insert(0),
    }),
    snip({
      trig = "Reld",
      name = "C4 Rel",
    }, {
      text("Rel_Down("),
      insert(1, "from"),
      text(", "),
      insert(2, "to"),
      text(', "'),
      insert(3, "label"),
      text('", "'),
      insert(4, "tech"),
      text('", "'),
      insert(5, ""),
      text('")'),
      insert(0),
    }),
    snip({
      trig = "Relu",
      name = "C4 Rel",
    }, {
      text("Rel_Up("),
      insert(1, "from"),
      text(", "),
      insert(2, "to"),
      text(', "'),
      insert(3, "label"),
      text('", "'),
      insert(4, "tech"),
      text('", "'),
      insert(5, ""),
      text('")'),
      insert(0),
    }),
  }
}
