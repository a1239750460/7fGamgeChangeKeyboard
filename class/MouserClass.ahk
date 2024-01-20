MyGui := Gui("AlwaysOnTop -Caption ToolWindow")

;新建窗口对象，「AlwaysOnTop」窗口置顶，「-Caption」去除标题和边框，「ToolWindow」去除任务栏按钮

MyEdit := MyGui.Add("Edit", "W500 R1 Background505050")

;新建编辑控件，「W500」控件宽度为 500 像素，「R1」限制一行，「Background505050」设置背景

LV := MyGui.Add("ListView", "W500 -Hdr -Multi ReadOnly R3 Background505050", ["name"])

;新建表格视图，「-Hdr」隐藏标题，「-Multi」禁止一次选择多行

LV.Add(, "FullName")

;添加新行到表格底部

;(Gui / GuiControl).OnEvent(...)

;监听事件（按下 Esc，按下 Enter，失去焦点，点击）

MyGui.show("AutoSize Center")

;显示窗口

HotIfWinActive "ahk_class AutoHotkeyGUI"

;Hotkey "^n", Function

;设置只在「AutoHotkeyGUI」窗口类中生效的快捷键

;Run Command, WorkingDir

;运行外部程序 作者：-l0_0l- https://www.bilibili.com/read/cv14338833/ 出处：bilibili
