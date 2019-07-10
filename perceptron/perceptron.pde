class Perceptron{
  float weights[] = new float[3];
  float lr = 0.1; //learning rate
  float bias = 1;
  // constructor
  
  Perceptron(int n){
    // randomly initialized weights
    float weights[] = new float[n];
    for(int i = 0; i<weights.length; i++)
    {
      float rando = random(-1,1);
      while(rando == 0)
      {
        rando = random(-1,1);
      }
      weights[i] = rando;
    }
  }  
  
  int activate(float n)
  {
    if(n>=0)
      return 1;
    return -1;
  }
  
  int guess(float[] inputs)
  {
    //weighted sum of all weights*input
    float sum = 0;
    
    for(int i = 0; i<inputs.length; i++)
    {
      sum += inputs[i] * weights[i];
    }
    return activate(sum);
  }
  
  void train(float[] inputs, int target){
    int guess = guess(inputs);
    int error = target-guess;    
    
    for(int i = 0; i<weights.length; i++)
    {
      //tuning the weights
      weights[i] += error*inputs[i]*lr;
    }
  }
  float guessY(float x)
  {
    return -(weights[2]/weights[1])- (weights[0]/weights[1]) *x;  
    
  }
}
