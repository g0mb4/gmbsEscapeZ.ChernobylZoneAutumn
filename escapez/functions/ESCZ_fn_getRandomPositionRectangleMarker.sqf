params["_mark"];
private["_posX", "_posY", "_isWater", "_x", "_y", "_w", "_h"];

_isWater = true;

_posXY = getMarkerPos _mark;
_sizeWH = getMarkerSize _mark;

_w = (_sizeWH select 0) * 2;
_h = (_sizeWH select 1) * 2;

_x = (_posXY select 0) - (_sizeWH select 0);
_y = (_posXY select 1) - (_sizeWH select 1);

while { _isWater } do
{
	_posX = random _w;
	_posX = _posX + _x;

	_posY = random _h;
	_posY = _posY + _y;

	_isWater = surfaceIsWater [_posX, _posY];
};

_pos = [_posX, _posY, 0.30];

_pos;	// last line -> return
