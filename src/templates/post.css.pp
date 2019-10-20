#lang pollen

.body{
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
}

.navi{
    display: flex;
    flex-grow: 1;
    flex-wrap: wrap;
    justify-content: space-around;
}
.triangle-up {
	width: 0;
	height: 0;
	border-left: 1em solid transparent;
	border-right: 1em solid transparent;
	border-bottom: 2em solid #000000;
}
.triangle-down {
	width: 0;
	height: 0;
	border-left: 1em solid transparent;
	border-right: 1em solid transparent;
	border-top: 2em solid #000000;
}

.snippet{
    flex-grow: 2;
    flex-align: flex-end;
}

.takeover{
    flex-grow: 9999;
}

.text{
    flex-grow: 2;
    flex-align: flex-start;
}


