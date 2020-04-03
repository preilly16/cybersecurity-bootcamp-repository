## Terminal Homework Solution File: ♣♦♠♥ A High Stakes Investigation ♣♦♠♥!

### Step 1: Investigation Preparation

- To make the directories, run the following commands:
  
    - `mkdir Lucky_Duck_Investigations`
    - `cd Lucky_Duck_Investigations`
    - `mkdir Roulette_loss_Investigation`
    - `cd Roulette_loss_Investigation`
    - `mkdir Player_Analysis Dealer_Analysis Player_Dealer_Correlation`
    - `touch Player_Analysis/Notes_Player_Analysis Dealer_Analysis/Notes_Dealer_Analysis Player_Dealer_Correlation/Notes_Player_Dealer_Correlation`

### Step 2: Gathering Evidence


To move over the win/loss files:

  - `mv ../../../Roulette_Player_WinLoss_0310/0310*` 
  - `mv ../../../Roulette_Player_WinLoss_0310/0312*` 
  - `mv ../../../Roulette_Player_WinLoss_0310/0315*` 
    
To move over the dealer schedule files  

  - `mv ../../../Dealer_Schedules_0310/0310*` 
  - `mv ../../../Dealer_Schedules_0310/0312*` 
  - `mv ../../../Dealer_Schedules_0310/0315*` 


### Step 3: Correlating the Evidence


**Player Analysis**  

  - Navigate into the directory 
  
    - `cd Player_Analysis`.

  - Preview one file by running 
  
    - `head 0310_win_loss_player_data`.

    - Note that losses are indicated by a negative number or `a *-*`.

  - `grep` the losses based on that value and then place it into a file called: `Roulette_Losses` , 
    
    - Run: `grep - * > Roulette_Losses`

  - Preview the file: 
  
    - `head Roulette_Losses`

  - Add the following in the notes files using nano: `nano Notes_Player_Analysis`.
  
  - Times of the Losses:
  
    ```
    0310_:05:00:00	AM
    0310_:08:00:00	AM
    0310_:02:00:00	PM
    0310_:08:00:00	PM
    0310_:11:00:00	PM
    0312_:05:00:00	AM
    0312_:08:00:00	AM
    0312_:02:00:00	PM
    0312_:08:00:00	PM
    0312_:11:00:00	PM
    0315_:05:00:00	AM
    0315_:08:00:00	AM
    0315_:02:00:00	PM
    ```

- Note that the same person in every time of loss is: `Mylie Schmidt`.
  
- To figure out the count of time the player played:
  
  - `grep 'Mylie Schmidt' Roulette_Losses| wc -l`
  - Answer is : `13`
          
**Dealer Analysis**   
- Navigate into the directory 
  - `cd Dealer_Analysis`

- Preview one file by running 
  - `head 0310_Dealer_schedule`

- Note that the columns are separated out by spaces:
  - The columns numbers for the four fields are: ($1, $2, $5, and $6)
    
- Here are the scripts for each time the losses occurred:    
    
    ```cat 0310_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '05:00:00 AM' > Dealers_working_during_losses
    cat 0310_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '08:00:00 AM' >> Dealers_working_during_losses
    cat 0310_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '02:00:00 PM' >> Dealers_working_during_losses
    cat 0310_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '08:00:00 PM' >> Dealers_working_during_losses
    cat 0310_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '11:00:00 PM' >> Dealers_working_during_losses
    cat 0312_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '05:00:00 AM' >> Dealers_working_during_losses
    cat 0312_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '08:00:00 AM' >> Dealers_working_during_losses
    cat 0312_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '02:00:00 PM' >> Dealers_working_during_losses
    cat 0312_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '08:00:00 PM' >> Dealers_working_during_losses
    cat 0312_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '11:00:00 PM' >> Dealers_working_during_losses
    cat 0315_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '05:00:00 AM' >> Dealers_working_during_losses
    cat 0315_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '08:00:00 AM' >> Dealers_working_during_losses
    cat 0315_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '02:00:00 PM' >> Dealers_working_during_losses
    
- Use `nano Dealers_working_during_losses` to add the following to the notes file: 

  - The Dealer working during the time of the losses is always "Billy Jones".

  - To get the count run the following `grep "Billy Jones" Dealers_working_during_losses | wc -l`
  
  - The answer is: `13`
  
#### Player/Employee Correlation

- In the notes file, add summary that explains the following:  
  
  - There is one dealer and one player that always play during the time of the losses, Billy Jones and Mylie Schmidt respectively.
  
  - They were also both playing and working the exact 13 times, which is highly suspicious.
   
 
### Step 4: Scripting your Tasks

- Create the shell script:  

  - `nano roulette_dealer_finder_by_time.sh`

- Inside the shell script place: 

  - `cat $1_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep "$2"`

- Save the script.

- Test the script by running:

  - `sh roulette_dealer_finder_by_time.sh 0310 '02:00:00 PM'`

- Point out the arguments are:

  - `$1 = 0310`
  - `$2 = '02:00:00 PM'`

- After running the script, it should show:
  
  -  `02:00:00 PM Billy Jones`

      
**Bonus**

- Create the shell script: 

  - `roulette_dealer_finder_by_time_and_game.sh`

- Inside the shell script, place: `cat $1_Dealer_schedule | awk -F" " '{print $1, $2, '$3','$4' }'| grep "$2"`
  
  - To view the Dealer for BlackJack on 3/10 at 2:00 PM run:
      
      - `sh roulette_dealer_finder_by_time_and_game.sh 0310 '02:00:00 PM' '$3' '$4'`
  
  - To view the Dealer for Roulette on 3/10 at 2:00 PM run:
  
      - `sh roulette_dealer_finder_by_time_and_game.sh 0310 '02:00:00 PM' '$5' '$6'`
  
  
  - To view the Dealer for Texas Hold Em on 3/10 at 2:00 PM run:
  
      - `sh roulette_dealer_finder_by_time_and_game.sh 0310 '02:00:00 PM' '$7' '$8'`

---

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.

