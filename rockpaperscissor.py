import random

rock = 0
paper = 1
scissors = 2
actions = {rock: 'Rock', paper: 'Paper', scissors: 'Scissors'}

print("Welcome to My Rock Paper Scissors\nLike it says you have 3 Choices Rock Paper Scissors\nRock = 0\nPaper = 1\nScissors = 2")

while True:
	try:
		user_input = int(input("Input : "))
		if user_input in actions:
			break
		else:
			print("Invalid input. Please enter 0, 1, or 2.")
	except ValueError:
		print("Invalid input. Please enter a number.")

computer_input = random.randint(0,2)

if user_input == rock and  computer_input == scissors : 
	result = 'You win!'
elif user_input == paper and computer_input == rock:
	result = 'You win!'
elif user_input == scissors and computer_input == paper:
    result = 'You Win'
elif user_input == computer_input:
    result = 'Draw'
else:
	result = 'You lose!'

computer_action = actions[computer_input]
human_action = actions[user_input]
print(f"{result}\nUsers action was {human_action}\nComputers action was {computer_action}")