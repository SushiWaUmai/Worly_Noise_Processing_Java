PVector[] points = new PVector[25];
float intensity = 1;
float randomMovement = 10;

void setup()
{
  size(750, 750);
  
  background(255);
  
  for(int i = 0; i < points.length; i++)
  {
    points[i] = new PVector(random(0, width), random(0, height));
  }
}

void draw()
{
  clear();
  
  loadPixels();
  
  for(int y = 0; y < height; y++)
  {
    for(int x = 0; x < width; x++)
    {
      pixels[y * height + x] = color(255 - (getNearestPoint(x, y) * intensity));
    }
  }
  
  updatePixels();
  
  for(PVector p : points)
  {
    p.set(p.x + random(-randomMovement, randomMovement), p.y + random(-randomMovement, randomMovement));
    
    if(p.x > width)
      p.x -= width;
    else if(p.y > height)
      p.y -= height;
    else if(p.x < 0)
      p.x += width;
    else if(p.y < 0)
      p.y += height;
  }
}

float getNearestPoint(int x, int y)
{
  float distance = Float.MAX_VALUE;
  for(PVector p : points)
  {
    float d = dist(p.x, p.y, x, y);
    if(d < distance)
      distance = d;
  }
  
  return distance;
}
