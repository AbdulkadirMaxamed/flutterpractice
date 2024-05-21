void main(){

  List<int> ticket1 = [45,2,9,18,12,33];
  List<int> ticket2 = [41,17,26,32,7,35];

  checkNumbers(ticket1);

}

List<int> winningNumbers = [12,6,34,22,41,9];

void checkNumbers(List<int> myNumbers){
  int matching=0;
  // for(int myNumbers in List<int> winningNumbers){
  //   matching++;
  //   print('you have $matching matching number');
  // }
  print(myNumbers);
  print(winningNumbers);

  for (int myNum in myNumbers){
    print(myNum);

    for (winningNumbers in winningNumbers){
      matching++;
    }
  }

  print('there are $matching');
}