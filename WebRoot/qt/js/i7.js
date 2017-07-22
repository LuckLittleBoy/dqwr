function isMatch(str1,str2) 
{  
var index = str1.indexOf(str2); 
if(index==-1) return false; 
return true; 
} 


function ResumeError() { 
return true; 
} 
window.onerror = ResumeError; 

function $(id) {
    return document.getElementById(id);
}
// ��Գߴ�
function GetOffsetTop (el, p) {
    var _t = el.offsetTop;
    var _p = el.offsetParent;

    while (_p) {
        if (_p == p) break;
        _t += _p.offsetTop;
        _p = _p.offsetParent;
    }

    return _t;
};
function GetOffsetLeft (el, p) {
    var _l = el.offsetLeft;
    var _p = el.offsetParent;

    while (_p) {
        if (_p == p) break;
        _l += _p.offsetLeft;
        _p = _p.offsetParent;
    }

    return _l;
};
function showMenu (baseID, divID) {
    baseID = $(baseID);
    divID  = $(divID);

    //var l = GetOffsetLeft(baseID);
    //var t = GetOffsetTop(baseID);

    //divID.style.left = l + 'px';
//    divID.style.top = t + baseID.offsetHeight + 'px';
    if (showMenu.timer) clearTimeout(showMenu.timer);
	hideCur();
    divID.style.display = 'block';
	showMenu.cur = divID;

    if (! divID.isCreate) {
        divID.isCreate = true;
        //divID.timer = 0;
        divID.onmouseover = function () {
            if (showMenu.timer) clearTimeout(showMenu.timer);
			hideCur();
            divID.style.display = 'block';
        };

        function hide () {
            showMenu.timer = setTimeout(function () {divID.style.display = 'none';}, 1000);
        }

        divID.onmouseout = hide;
        baseID.onmouseout = hide;
    }
	function hideCur () {
		showMenu.cur && (showMenu.cur.style.display = 'none');
	}
}
