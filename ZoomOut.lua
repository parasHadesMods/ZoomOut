ModUtil.RegisterMod("ZoomOut")


ModUtil.WrapBaseFunction("AdjustZoom", function(baseFunc, args)
  args = args or {}
  ZoomOut.PreviousZoomFraction = args.Fraction
  baseFunc(args)
end)

OnControlPressed { "Gift",
  function ( triggerArgs )
    local previousFraction = ZoomOut.PreviousZoomFraction
    if previousFraction > 0.5 then
      AdjustZoom({ Fraction = 0.5, LerpTime = 0.5})
    elseif previousFraction > 0.25 then
      AdjustZoom({ Fraction = 0.25, LerpTime = 0.5})
    elseif CurrentRun and CurrentRun.CurrentRoom.ZoomFraction then
      AdjustZoom({ Fraction = CurrentRun.CurrentRoom.ZoomFraction, LerpTime = 0.75 })
    else
      AdjustZoom({ Fraction = 1.0, LerpTime = 0.75 })
    end
  end
}
