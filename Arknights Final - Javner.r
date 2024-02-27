# Michael K. Javner
# IT 461
# 26 Feb 2024
#
# Arknights Final

# Set Working Directory
setwd("G:/My Drive/School/Tacoma CC/IT 441/Scripts")

# Echo Working Directory
getwd()

# Read CSV file & saves to variable
AK_CSV <- read.csv("Arknights Data.csv") # nolint: object_name_linter.

# Display available columns in CSV file
ls(AK_CSV)

# Display # of unique Operators
message("Number of Playable Operators in Arknights")
length(AK_CSV$name)

# Display Operator Rarity & their associated Class
# AK_CSV[,c("name", "stars", "class")]

AK_LS <- (AK_CSV[, c("name", "stars", "class")]) # nolint: object_name_linter.

#summary(AK_LS)

#head(AK_LS)

#tail(AK_LS)

#AK_CSV[AK_CSV$class == "Guard", ]

# Returns True if search matches value
AK_CSV$class == "Guard"

total_Vanguard <- sum(AK_CSV$class == "Vanguard") # nolint: object_name_linter.
total_Guard <- sum(AK_CSV$class == "Guard") # nolint: object_name_linter.
total_Defender <- sum(AK_CSV$class == "Defender") # nolint: object_name_linter.
total_Sniper <- sum(AK_CSV$class == "Sniper") # nolint: object_name_linter.
total_Caster <- sum(AK_CSV$class == "Caster") # nolint: object_name_linter.
total_Medic <- sum(AK_CSV$class == "Medic") # nolint: object_name_linter.
total_Support <- sum(AK_CSV$class == "Supporter") # nolint: object_name_linter.
total_Specialist <- sum(AK_CSV$class == "Specialist") # nolint: object_name_linter, line_length_linter.

# Create the data for the chart
class_total <- c(total_Vanguard, total_Guard, total_Defender, total_Sniper, total_Caster, total_Medic, total_Support, total_Specialist) # nolint: line_length_linter.
class_name <- c("Vanguard", "Guard", "Defender", "Sniper", "Caster", "Medic", "Support", "Specialist")
 
# Plot the bar chart
barplot(class_total, names.arg = class_name, xlab = "Classes",
        ylab = "Numbers", col = "steelblue",
        main = "Arknights Total Numbers by Class",
        cex.main = 2.0, cex.lab = 1.5, cex.axis = 1.0,
        ylim = range(pretty(c(0, class_total))))