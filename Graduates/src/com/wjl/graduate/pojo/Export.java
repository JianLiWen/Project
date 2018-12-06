package com.wjl.graduate.pojo;

public class Export {
public String place;
public int number;
private int total;
@Override
public String toString() {
	return "Export [place=" + place + ", number=" + number + "]";
}
public String getPlace() {
	return place;
}
public void setPlace(String place) {
	this.place = place;
}
public int getNumber() {
	return number;
}
public void setNumber(int number) {
	this.number = number;
}

public int getTotal() {
	return total;
}
public void setTotal(int total) {
	this.total = total;
}

public Export(String place, int number, int total) {
	super();
	this.place = place;
	this.number = number;
	this.total = total;
}
public Export() {
	super();
}

}
