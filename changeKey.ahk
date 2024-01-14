#Requires AutoHotkey v2.0
InstallKeybdHook
InstallMouseHook
global isMapping := false
q::
{   
  Send "c"   
}
w::
{
  if(isMapping){
    global isMapping := false
    return
  }
  global isMapping := true
  Send "e"
}
e::
{
  if(isMapping){
    global isMapping := false
    return
  }
  global isMapping := true
  Send "w"
}
r::
{
  if(isMapping){
    global isMapping := false
    return
  }
  global isMapping := true
  Send "d"
}


j::k
k::j