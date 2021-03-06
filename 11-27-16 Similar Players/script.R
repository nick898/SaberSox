# Given a MLB player, this script will find the players who are most similiar
# to the given player. The inputs needed are a given player ID, his age, and 
# number of top similar players you'd like to find. 
#
# This script uses a couple of functions that I created
#   1. "AgeEqPlayer"
#   2. "NearNeigh"
# See those functions for descriptions of what they do.
# The file "Batting.csv" contains all of the player data

library(Lahman)

#PLAYER INPUT
Age = 22 #Player age
pid = "bettsmo01" #Player ID 
NumNeighbors = 10 #Set the number of players you'd like to find who are most similar to your given player


M = Master
M2 = data.frame(M$playerID,M$nameFirst,M$nameLast)
colnames(M2) = c("playerID", "nameFirst", "nameLast")



BatAge = AgeEqPlayer(Age,Bat) #Bat is the data from "Batting.csv"
NearestNeighbors = NearNeigh(pid, NumNeighbors, BatAge)

NearestNeighbors = merge(M2,NearestNeighbors)
NearestNeighbors = NearestNeighbors[order(NearestNeighbors$dist),]
