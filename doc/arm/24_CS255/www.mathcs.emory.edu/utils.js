function elementsToggle(elsIds)
{
	var state = true;
	for (var i = 0; i < elsIds.length; i++)
	{
		state = elementToggle(elsIds[i]);
	}
	return state;
}

function elementsSyncToggle(elsIds)
{
	var allHidden = true;
	for (var i = 0; i < elsIds.length; i++)
	{
		if (document.getElementById(elsIds[i]).style.display != "none")
		{
			allHidden = false;
			break;
		}
	}
	if (allHidden)
	{
		elementsShow(elsIds);
	}
	else
	{
		elementsHide(elsIds);
	}
	return !allHidden;
}

function elementToggle(elId)
{
	var el = document.getElementById(elId);
	var hidden = el.style.display == "none";
	el.style.display = hidden ? "" : "none";
	return hidden;
}

function elementsShow(elsIds)
{
	for (var i = 0; i < elsIds.length; i++)
		elementShow(elsIds[i]);
}

function elementsHide(elsIds)
{
	for (var i = 0; i < elsIds.length; i++)
		elementHide(elsIds[i]);
}

function elementShow(elId)
{
	var el = document.getElementById(elId);
	el.style.display = "";
}

function elementHide(elId)
{
	var el = document.getElementById(elId);
	el.style.display = "none";
}

function viewportOffsetX()
{
	if (typeof(window.pageXOffset) == "number" && typeof(window.pageYOffset) == "number")
	{
		return self.pageXOffset;
	}
	else if (typeof(document.documentElement) == "object")
	{
		return document.documentElement.scrollLeft;
	}
	else
	{
		return document.body.scrollLeft;
	}
}

function viewportOffsetY()
{
	if (typeof(window.pageXOffset) == "number" && typeof(window.pageYOffset) == "number")
	{
		return self.pageYOffset;
	}
	else if (typeof(document.documentElement) == "object")
	{
		return document.documentElement.scrollTop;
	}
	else
	{
		return document.body.scrollTop;
	}
}

function viewportWidth()
{
	if (typeof(window.innerHeight) == "number" && typeof(window.innerWidth) == "number")
	{
		return window.innerWidth;
	}
	else if (typeof(document.documentElement) == "object")
	{
		return document.documentElement.clientWidth;
	}
	else
	{
		return document.body.clientWidth;
	}
}

function viewportHeight()
{
	if (typeof(window.innerHeight) == "number" && typeof(window.innerWidth) == "number")
	{
		return window.innerHeight;
	}
	else if (typeof(document.documentElement) == "object")
	{
		return document.documentElement.clientHeight;
	}
	else
	{
		return document.body.clientHeight;
	}
}

function eventPosX(event)
{
 	if (typeof(event.pageX) == "number" && typeof(event.pageY) == "number")
	{
		return event.pageX;
	}
	else if (typeof(document.documentElement) == "object")
	{
		return event.clientX + document.documentElement.scrollLeft;
	}
	else
	{
		return event.clientX + document.body.scrollLeft;
	}
}

function eventPosY(event)
{
 	if (typeof(event.pageX) == "number" && typeof(event.pageY) == "number")
	{
		return event.pageY;
	}
	else if (typeof(document.documentElement) == "object")
	{
		return event.clientY + document.documentElement.scrollTop;
	}
	else
	{
		return event.clientY + document.body.scrollTop;
	}
}

function elementWidth(el)
{
	return el.offsetWidth;
}

function elementHeight(el)
{
	return el.offsetHeight;
}

function elementPosX(el)
{
	var x = 0;
	while (el.offsetParent)
	{
		x += el.offsetLeft
		el = el.offsetParent;
	}
	return x;
}

function elementPosY(el)
{
	var y = 0;
	while (el.offsetParent)
	{
		y += el.offsetTop
		el = el.offsetParent;
	}
	return y;
}
