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
  int y;
  int x;
  int x_pos;
  int y_pos;
  public Square(color c, int face, int row, int col)
  {
    this.c = c;
    this.face = face;
    if(dim/2 == 0 && row >= dim/2)
    {
      this.y = dim/2-row-1;
    }
    else
    {
      this.y = dim/2-row;
    }
    if(dim/2 == 0 && col > dim/2)
    {
      this.x = col-dim/2-1;
    }
    else
    {
      this.x = col-dim/2;
    }
    x_pos = width-face_size*(face+2)+col*square_size;
    y_pos = height/2+row*square_size;
    if(face == 4)
    {
      x_pos = width-face_size*3+col*square_size;
      y_pos = height/2-face_size+row*square_size;
    }
    if(face == 5)
    {
      x_pos = width-face_size*3+col*square_size;
      y_pos = height/2+face_size+row*square_size;
    }
  }
  
  
  void draw_square()
  {
    fill(c);
    square(x_pos,y_pos,square_size);
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
        //println(cube[face][row][col].y, ' ', cube[face][row][col].y);
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
        //text(cube[face][row][col].y,cube[face][row][col].x_pos,cube[face][row][col].y_pos);
      }
    }
  }
}

void rotate_row(int row)
{
  color temp;
  for(int col = 0; col<dim; col++)
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
      rotate_face_counter(4);
    }
    if(row == dim-1)
    {
      rotate_face_clock(5);
    }
}

void rotate_column(int col)
{
  color temp;
  for(int row = 0; row<dim; row++)
  {
    temp = cube[1][row][col].c;
    cube[1][row][col].c = cube[5][row][col].c;
    cube[5][row][col].c = cube[4][row][col].c;
    cube[4][row][col].c = temp;
  }
  if(col == 0)
  {
    rotate_face_counter(2);
  }
  if(col == dim-1)
  {
    rotate_face_clock(0);
  }
}

Square rotate_square_counter(int face, int row, int col)
{
  int[] coor = {cube[face][row][col].x, cube[face][row][col].y};
//  println(coor[0], ' ',coor[1]);
  int[] new_coor = {-coor[1],coor[0]};
 // println(new_coor[0], ' ',new_coor[1]);
  Square square = cube[0][0][0];
  for(int r = 0; r<dim; r++)
  {
    for(int c = 0; c<dim; c++)
    {
      if(cube[face][r][c].x == new_coor[0] && cube[face][r][c].y == new_coor[1])
      {
        square = cube[face][r][c];
        //println(square.x,' ', square.y);
      }
    }
  }
  return(square);
}

Square rotate_square_clock(int face, int row, int col)
{
  int[] coor = {cube[face][row][col].x, cube[face][row][col].y};
//  println(coor[0], ' ',coor[1]);
  int[] new_coor = {coor[1],-coor[0]};
 // println(new_coor[0], ' ',new_coor[1]);
  Square square = cube[0][0][0];
  for(int r = 0; r<dim; r++)
  {
    for(int c = 0; c<dim; c++)
    {
      if(cube[face][r][c].x == new_coor[0] && cube[face][r][c].y == new_coor[1])
      {
        square = cube[face][r][c];
        //println(square.x,' ', square.y);
      }
    }
  }
  return(square);
}

void rotate_face_counter(int face)
{
    color[][] temp = new color[dim][dim];
    for(int c = 0; c<dim;c++)
    {
      for(int r = 0; r<dim;r++)
      {
        temp[r][c] = cube[face][r][c].c;
      }
    }
    for(int c = 0; c<dim;c++)
    {
      for(int r = 0; r<dim;r++)
      {
        rotate_square_counter(face,r,c).c = temp[r][c];
      }
    }
}

void rotate_face_clock(int face)
{
    color[][] temp = new color[dim][dim];
    for(int c = 0; c<dim;c++)
    {
      for(int r = 0; r<dim;r++)
      {
        temp[r][c] = cube[face][r][c].c;
      }
    }
    for(int c = 0; c<dim;c++)
    {
      for(int r = 0; r<dim;r++)
      {
        rotate_square_clock(face,r,c).c = temp[r][c];
      }
    }
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
    rotate_column(0);
  }
  if(key == '5')
  {
    rotate_column(1);
  }
  if(key == '6')
  {
    rotate_column(2);
  }
}
