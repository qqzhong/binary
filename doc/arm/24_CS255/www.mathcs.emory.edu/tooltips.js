var cfgTooltipOffsetX = -50;
var cfgTooltipOffsetY = 0;
var globTooltipActive = false;

function tooltipOver(tooltipInfo)
{

	if (globTooltipActive)
		return;

 	var tooltip = document.getElementById(tooltipInfo.elementId);
 	var refElement = document.getElementById(tooltipInfo.refElementId);

 	tooltip.style.display = "";
 	
 	var tooltipWidth = elementWidth(tooltip);
 	var tooltipHeight = elementHeight(tooltip);
	var refElementX = elementPosX(refElement);
	var refElementY = elementPosY(refElement);
	var refElementWidth = elementWidth(refElement);
		
	tooltip.style.left = Math.round(refElementX + refElementWidth / 2 + cfgTooltipOffsetX) + "px";
	tooltip.style.top = Math.round(refElementY - tooltipHeight + cfgTooltipOffsetY) + "px";
 	
 	tooltip.style.visibility = "visible";
 	
 	if (tooltipInfo.refElementFocusedCssClass)
	 	refElement.className = tooltipInfo.refElementFocusedCssClass;

}

function tooltipOut(tooltipInfo)
{
	if (globTooltipActive) return;
	tooltipHideInternal(tooltipInfo);
}

function tooltipClick(tooltipInfo)
{
	globTooltipActive = true;
}

function tooltipClose(tooltipInfo)
{
	tooltipHideInternal(tooltipInfo);
	globTooltipActive = false;
}

function tooltipHideInternal(tooltipInfo)
{

 	var tooltip = document.getElementById(tooltipInfo.elementId);
 	var refElement = document.getElementById(tooltipInfo.refElementId);
 	
 	tooltip.style.visibility = "hidden";
 	tooltip.style.display = "none";
 	
 	if (tooltipInfo.refElementNormalCssClass)
	 	refElement.className = tooltipInfo.refElementNormalCssClass;

}

/*

function tooltipShow(mouseEvent, tooltipId)
{

 	var tooltip = document.getElementById(tooltipId);
 	tooltip.style.display = "block";

	tooltipMove(mouseEvent, tooltipId);

 	tooltip.style.visibility = "visible";

}

function tooltipHide(mouseEvent, tooltipId)
{
 	var tooltip = document.getElementById(tooltipId);
 	tooltip.style.visibility = "hidden";
 	tooltip.style.display = "none";
}

function tooltipMove(mouseEvent, tooltipId)
{

	var offsetX = 25;
	var offsetY = 10;
	var buffer = 20;
 
 	var tooltip = document.getElementById(tooltipId);
 	if (!mouseEvent) mouseEvent = window.event;
 	
 	var vportWidth = viewportWidth();
 	var vportHeight = viewportHeight();
 	var vportOffsetX = viewportOffsetX();
 	var vportOffsetY = viewportOffsetY();
 	var tooltipWidth = elementWidth(tooltip);
 	var tooltipHeight = elementHeight(tooltip);
 	var mouseX = eventPosX(mouseEvent);
 	var mouseY = eventPosY(mouseEvent);
 	
 	var tooltipX, tooltipY;
 	
 	if (vportWidth + vportOffsetX < mouseX + offsetX + tooltipWidth + buffer)
 	{
 		tooltipX = mouseX - tooltipWidth - offsetX;
 	}
 	else
 	{
 		tooltipX = mouseX + offsetX;
 	}

 	if (vportHeight + vportOffsetY < mouseY + offsetY + tooltipHeight + buffer)
 	{
 		tooltipY = mouseY - tooltipHeight - offsetY;
 	}
 	else
 	{
 		tooltipY = mouseY + offsetY;
 	}

 	tooltip.style.left = tooltipX + "px";
 	tooltip.style.top = tooltipY + "px";

}

*/