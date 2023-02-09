// Bryce  Thomson | Nov 2022 | Calc Project

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];
String dVal = "0.0";
float l, r, result;
char op = ' ';
boolean left = true;

void setup() {
  size(580, 810);
  numButtons[0] = new Button(100, 335, 80, 80, '1');
  numButtons[1] = new Button(250, 335, 80, 80, '2');
  numButtons[2] = new Button(400, 335, 80, 80, '3');
  numButtons[3] = new Button(100, 490, 80, 80, '4');
  numButtons[4] = new Button(250, 490, 80, 80, '5');
  numButtons[5] = new Button(400, 490, 80, 80, '6');
  numButtons[6] = new Button(100, 625, 80, 80, '7');
  numButtons[7] = new Button(250, 625, 80, 80, '8');
  numButtons[8] = new Button(400, 625, 80, 80, '9');
  numButtons[9] = new Button(100, 755, 80, 80, '0');
  opButtons[0] = new Button(325, 755, 230, 80, '.');
  opButtons[1] = new Button(70, 236, 58, 58, '←');
  opButtons[2] = new Button(160, 236, 58, 58, '→');
  opButtons[3] = new Button(250, 236, 58, 58, 'π');
  opButtons[4] = new Button(340, 236, 58, 58, '√');
  opButtons[5] = new Button(430, 236, 58, 58, '(');
  opButtons[6] = new Button(520, 236, 58, 58, ')');
  opButtons[7] = new Button(520, 320, 58, 58, 'C');
  opButtons[8] = new Button(520, 410, 58, 58, '+');
  opButtons[9] = new Button(520, 500, 58, 58, '-');
  opButtons[10] = new Button(520, 590, 58, 58, '/');
  opButtons[11] = new Button(520, 680, 58, 58, '*');
  opButtons[12] = new Button(520, 770, 58, 58, '=');
}



void draw() {
  background(255, 0, 0);
  updateDisplay();
  fill(0);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}



void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.length()<20) {
      handleEvent(str(numButtons[i].val), true);
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on) {
      handleEvent(str(opButtons[i].val), false);
    }
  }
}



void keyPressed() {
  println("KEY:" + key + " keyCode:" + keyCode);

  if (key == '0') {
    handleEvent("0", true);
  } else if (key == '1') {
    handleEvent("1", true);
  } else if (key == '2') {
    handleEvent("2", true);
  } else if (key == '3') {
    handleEvent("3", true);
  } else if (key == '4') {
    handleEvent("4", true);
  } else if (key == '5') {
    handleEvent("5", true);
  } else if (key == '6') {
    handleEvent("6", true);
  } else if (key == '7') {
    handleEvent("7", true);
  } else if (key == '8') {
    handleEvent("8", true);
  } else if (key == '9') {
    handleEvent("9", true);
  } else if (key == '+') {
    handleEvent("+", false);
  } else if (key == '-') {
    handleEvent("-", false);
  } else if (key == '*') {
    handleEvent("*", false);
  } else if (key == '/') {
    handleEvent("/", false);
  } else if (key == '.') {
    handleEvent(".", false);
  } else if (key == 27 || key == 'C') {
    handleEvent("C", false);
  } else if (key == 10) { //(key == CODED) {
    if (keyCode == ENTER || keyCode == RETURN) {
      handleEvent("=", false);
    }
  }
}



void handleEvent(String val, boolean num) {
  if (left & num) { // Left Number
    if (dVal.equals("0") || result == 1) {
      dVal = (val);
      l = float(dVal);
    } else {
      dVal += (val);
      l = float(dVal);
    }
  } else if (!left && num) {
    if (dVal.equals("0") || result == l) {
      dVal = (val);
      r = float(dVal);
    } else {
      dVal += (val);
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0";
    result = 0.0;
    left = true;
    r = 0.0;
    l = 0.0;
    op = ' ';
  } else if (val.equals("+")) {
    result = l + r;
    dVal = str(result);
    l = result;
  } else if (val.equals("-")) {
    result = l - r;
    dVal = str(result);
    l = result;
  } else if (val.equals("/")) {
    result = l / r;
    dVal = str(result);
    l = result;
  } else if (val.equals("*")) {
    result = l * r;
    dVal = str(result);
    l = result;
  }
}



void updateDisplay() {
  rectMode(CENTER);
  fill(255, 0, 0);
  textSize(65);
  rect(width/2, 100, width-100, 200);
  fill(255);
  textAlign(RIGHT);
  if (dVal.length() < 10) {
    textSize(60);
  } else if (dVal.length() < 11) {
    textSize(55);
  } else {
    textSize(50);
  }
  text(dVal, width-150, 200);
  textSize(35);
}



void performCalculation (){
  if (op=='+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '/') {
    result = l / r;
  } else if (op == '*') {
    result = l * r;
  }
  dVal = str(result);
  l = result;
}
