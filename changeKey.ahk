#Requires AutoHotkey v2.0
InstallKeybdHook
InstallMouseHook
TraySetIcon("static/skill_yemujianglin.bmp")
MyGui := Gui()
MyGui.Title := "起凡改键"
;MyGui.Add("Text", "w200", "起凡游戏 : 『星雨阁』")
;MyGui.AddHotkey()
;setHotKeyEdit := MyGui.AddEdit("ReadOnly -TabStop Backgroundffffff")
MyGui.Show("w800 h400")
MyGui.OnEvent('Close', (*) => ExitApp())
; 使用 #HotIf 根据条件启用或禁用热键
title := "起凡游戏 : 『星雨阁』"
;#region 根据窗口标题来判断是否启动热键
;ListHotkeys
#HotIf WinActive(title)
; 映射按键，仅当条件为真时才会启用
q::c
w::e
e::w
r::d
d::r
1::!1
2::!2
3::!3
4::!4
5::!5
6::!6
7::!7
8::!8
9::!9
;使用send 发送按键相当于 按键释放才发送键，如果ctrl 按住不放，则不会发送键（o）且组合了其他键也不会发送键（o）
Ctrl:: Send "{o}"
Tab:: send " "
Space:: send "{F1 2}"
;:*:sjja::administrator
; 可以在后续定义更多的热键，它们都会受到 #HotIf 的影响

;鼠标相关
; 鼠标连点的定时器函数
mouseContunu := continuClick()
; 定义热键开始鼠标连点（鼠标中键触发）
MButton:: {
  (mouseContunu.Toggle) ? mouseContunu.Stop() : mouseContunu.Start(Check7Activation)
  return
}

; 检测当前进程是否是起凡
Check7Activation() {
  SetTimer(c7f, 10)
  c7f() {
    if (!WinActive(title)) {
      mouseContunu.Stop
      SetTimer(c7f, 0)
    }
  }
}

;OnExit _close
;_close(ExitReason, ExitCode) {
;  mouseContunu.Cleanup
;  MsgBox 123
;  return
;}
; 禁用 #HotIf
#HotIf
;#endregion
;test := "!d"
;Hotkey test, KeybordyMap
;KeybordyMap(ThisHotkey)
;{
;  MsgBox A_PriorKey
;}
;Pics := []
; 寻找几张图像用来展示.
;Loop Files "static\*.bmp"
;{
;  ; 载入找到的图像并添加到数组中.
;  Pics.Push(LoadPicture(A_LoopFileFullPath))
;}
;Loop
;{
;  TraySetIcon("HBITMAP:*" Pics[Mod(A_Index, Pics.Length) + 1])
;  Sleep 3000
;}
; 后续的热键将不受 #HotIf 影响
class continuClick {
  __New() {
    this.interval := 10
    this.Toggle := false
    ; Tick() 有一个隐式参数 "this", 其引用一个对象
    ; 所以, 我们需要创建一个封装了 "this " 和调用方法的函数:
    this.timer := ObjBindMethod(this, "Tick")
  }
  __Delete() {
    this.Cleanup
  }
  ; 开始连点
  Start(fn) {
    SetTimer this.timer, this.interval
    ToolTip "连点开启"
    fn
    this.Toggle := true
    return this.Toggle
  }
  ; 停止连点
  Stop() {
    ; 要关闭计时器, 我们必须传递和之前一样的对象:
    SetTimer this.timer, 0
    ToolTip "连点关闭"
    this.Cleanup
    this.Toggle := false
    return this.Toggle
  }
  ; 鼠标单击
  Tick() {
    Click
  }
  ; 清理函数
  Cleanup() {
    Tooltip
  }
}

; 当窗口关闭时清理定时器和提示
;OnExit mouseContunu.Cleanup
;global isMapping := false
;q::
;{
;  Send "c"
;}
;w::
;{
;  if(isMapping){
;    global isMapping := false;
;    return
;  }
;  global isMapping := true
;  Send "e"
;}
;e::
;{
;  if(isMapping){
;    global isMapping := false
;    return
;  }
;  global isMapping := true
;  Send "w"
;}
;r::
;{
;  if(isMapping){
;    global isMapping := false
;    return
;  }
;  global isMapping := true
;  Send "d"
;}
