# Michael K. Javner
# IT 461
# 26 Feb 2024
#
# Arknights Final Project

# Set Working Directory
setwd("G:/My Drive/School/Tacoma CC/IT 441/Scripts")

# Echo Working Directory
getwd()

# Read CSV file & saves to variable
ak_csv <- read.csv("Arknights Data.csv") 

# Display available columns in CSV file
ls(ak_csv)

# Return # of total operators
length(ak_csv$name)

###########################################################
#
# Table Section
#
###########################################################

library(data.table)

# Table built containing Operators Name, Class, & Rarity
ak_table <- data.table(Name = ak_csv$name,
                       Class = ak_csv$class,
                       Rarity = ak_csv$stars)

# Display the top 25x entries
head(ak_table, 25)

###########################################################
#
# Bar Graph Section
#
###########################################################


# Returns True/False if matches "Guard" under class column
# ak_csv$class == "Guard"

# Parses through all Operators by class
# Sum() function totals all True values meeting critiera
total_vanguard <- sum(ak_csv$class == "Vanguard")
total_guard <- sum(ak_csv$class == "Guard")
total_defender <- sum(ak_csv$class == "Defender")
total_sniper <- sum(ak_csv$class == "Sniper")
total_caster <- sum(ak_csv$class == "Caster")
total_medic <- sum(ak_csv$class == "Medic")
total_support <- sum(ak_csv$class == "Supporter")
total_specialist <- sum(ak_csv$class == "Specialist")

# Numbers used for bars
class_total <- c(total_vanguard, total_guard, total_defender, total_sniper, total_caster, total_medic, total_support, total_specialist)

# x-axis Bar Labels
class_name <- c("Vanguard", "Guard", "Defender", "Sniper", "Caster", "Medic", "Support", "Specialist")

# Creates the bar chart
#       xlab = x-axis label
#       ylab = y-axis label
#       col = bar graph color
#       main = title of graph
#       cex.main = title font size
#       cex.lab = x-axis font size
#       cex.axis = y-axis font size
#       ylim = creates the y-axis limits w/ range() being 0 - class_total value
#               pretty() creates a sequence of n + 1;
barplot(class_total, names.arg = class_name, xlab = "Classes",
        ylab = "Number of Operators", col = "steelblue",
        main = "Arknights: Total Operators by Class",
        cex.main = 2.0, cex.lab = 1.5, cex.axis = 1.0,
        ylim = range(pretty(c(0, class_total))))

###########################################################
#
# Pie Chart Section
#
###########################################################

# Color Palette library
library(RColorBrewer)

# Parses through all Operators by Gender
# Sum() function totals all True values meeting critiera
total_males <- sum(ak_csv$gender == "Male")
total_females <- sum(ak_csv$gender == "Female")

# Data for Pie Chart
ak_gender <- c(total_males, total_females)

# Percentage (Label) for Pie Chart
# Equation Example => 100 * MALE / total_operators
#       round() equation to 2 decimal places
#       paste0() adds the % of String
gender_ratio <- paste0(round(100 * ak_gender / sum(ak_gender), 2), "%")

# Color for Pie Chart
color_palette <- brewer.pal(3, "Pastel1")

# Creates the pie chart
pie(ak_gender, labels = gender_ratio, col = color_palette)

legend("topleft", legend = c("Female", "Male"),
       fill =  c("lightblue", "mistyrose"))

###########################################################
#
# Scatter Plot Section
#
###########################################################

library("ggplot2")

# Create Vector containing Operators Class being Guard
ak_guards <- subset(ak_csv, class == "Guard")

# Creates Scatter Plot
#       aes() maps variables to visual properties; the aesthetics
#       geom_point() used to create scatterplot
ak_plot <- ggplot(ak_guards, aes(x = base_hp, y = base_atk)) + geom_point()

# Add Labels (Title, x-axis, y-axis)
ak_plot_fin <- ak_plot + labs(x = "Base HP", y = "Base ATK", title = "Guard Operators: HP vs Atk")

# Display the finished scatter plot
ak_plot_fin
