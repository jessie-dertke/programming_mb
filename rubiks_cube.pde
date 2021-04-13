color white = color(255,255,255);
color red = color(200,0,0);
color blue = color(0,0,200);
color orange = color(200,100,0);
color green = color(0,200,0);
color yellow = color(200,200,0);
color[] c_arr = {orange,red,yellow,white,green,blue};
int size = 800;
int face_size = size/8;
int dim = 3;
int square_size = face_size/dim;
Square[][][] cube  = new Square[6][dim][dim];

public class Square
{
  color c;
  int face;
  int row;
  int col;
  int x;
  int y;
  public Square(color c, int face, int row, int col)
  {
    this.c = c;
    this.face = face;
    if(dim/2 == 0 && row >= dim/2)
    {
      this.row = dim/2-row-1;
    }
    else
    {
      this.row = dim/2-row;
    }
    if(dim/2 == 0 && col > dim/2)
    {
      this.col = col-dim/2-1;
    }
    else
    {
      this.col = col-dim/2;
    }
    x = width-face_size*(face+2)+col*square_size;
    y = height/2+row*square_size;
    if(face == 4)
    {
      x = width-face_size*3+col*square_size;
      y = height/2-face_size+row*square_size;
    }
    if(face == 5)
    {
      x = width-face_size*3+col*square_size;
      y = height/2+face_size+row*square_size;
    }
  }
  
  
  void draw_square()
  {
    fill(c);
    square(x,y,square_size);
  }
  void change_color(color new_color)
  {
    c = new_color;
  }
}

void setup()
{
  size(800,800);
  frameRate(30);
  strokeWeight(2);
  for(int face = 0; face<6; face++)
  {
    for(int row = 0; row<dim; row++)
    {
      for(int col = 0; col<dim; col++)
      {
        cube[face][row][col] = new Square(c_arr[face],face,row,col);
        cube[face][row][col].draw_square();
      }
    }
  }
}

void draw()
{
  background(200);
  for(int face = 0; face<6; face++)
  {
    for(int row = 0; row<dim; row++)
    {
      for(int col = 0; col<dim; col++)
      {
        cube[face][row][col].draw_square();
      }
    }
  }
}

void rotate_row(int row)
{
  color temp;
  for(int col = 0; col<dim; col++)
  {
    if(row != 0 && row != dim-1)
    {
      temp = cube[0][row][col].c;
      for(int face = 0; face<3; face++)
      {
        cube[face][row][col].c = cube[face+1][row][col].c;
      }
      cube[3][row][col].c = temp;
    }
    if(row == 0)
    {
      temp = cube[0][row][col].c;
      for(int face = 0; face<3; face++)
      {
        cube[face][row][col].c = cube[face+1][row][col].c;
      }
      cube[3][row][col].c = temp;
      temp = cube[4][0][col].c;
    }
  }
}

void rotate_column(int col)
{
  color temp;
  for(int row = 0; row<dim; row++)
  {
    if(col == 1)
    {
      temp = cube[1][row][col].c;
      cube[1][row][col].c = cube[5][row][col].c;
      cube[5][row][col].c = cube[4][row][col].c;
      cube[4][row][col].c = temp;
    }
    if(col == 0)
    {
      
    }
  }
}

void rotate_face(int col)
{
}
void keyReleased()
{
  if(key == '1')
  {
    rotate_row(0);
  }
  if(key == '2')
  {
    rotate_row(1);
  }
  if(key == '3')
  {
    rotate_row(2);
  }
  if(key == '4')
  {
    rotate_column(1);
  }
}
