=begin
abc

a
b
c

ab
ac

a
a
a
a

b

each group is separated by a blank line
each person within a group is on a separate
line

For each group, count the number of letters that appear. Ignore duplicates
=end

customs_forms = ""
File.open('06.txt', 'r') do |f|
  f.each_line do |line|
    customs_forms += line
  end
end

def count_answered_questions(raw_input)
  group_forms = raw_input.split(/\n\n/).map { |group| group.gsub(/\n/, '') }
  group_forms.map { |group| group.chars.uniq }.map { |yes_answers| yes_answers.length }.sum
end

p count_answered_questions(customs_forms) == 6310

# Part II
# count questions where everyone answered yes

def count_questions_all_yes(raw_input)
  group_forms = raw_input.split(/\n\n/).map { |group| group.split(/\n/) }
  yes_answers = 0

  group_forms.each do |group|
    yes_answers += count_group_yes_answers(group) || 0
  end
  yes_answers
end

def count_group_yes_answers(group)
  num_people = group.length
  hash = {}

  # each person's answers, add count of char to hash
  group.each do |answers|
    answers.chars do |char|
      if hash[char]
        hash[char] += 1
      else
        hash[char] = 1
      end
    end
  end

  # iterate through hash, count chars where count == num_people
  count = 0
  hash.each do |_, char_count|
    count += 1 if char_count == num_people
  end

  count
end

p count_questions_all_yes(customs_forms) == 3193
p count_group_yes_answers(['abc']) == 3
p count_group_yes_answers(['a', 'b', 'c']) == 0
p count_group_yes_answers(['ab', 'ac']) == 1
p count_group_yes_answers(['a', 'a', 'a', 'a']) == 1
p count_group_yes_answers(['b']) == 1
