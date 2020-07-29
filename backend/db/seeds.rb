# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Favorite.delete_all
Task.delete_all
User.delete_all

tasks =
[{title: "Make the Bed", description: "Make the Bed First so that you start the day off right", link: "https://www.youtube.com/watch?v=qWJK5y1YZqE", image: "http://www.nacd.org/wp-content/uploads/2018/06/making_your_bed.jpg", category:"Morning Tasks"},
  {title: "Take Your Pills", description: "Take one Multivitamin, one Vitamin E fish oil, 1 bronkaid", link: "https://www.webmd.com/vitamins-and-supplements/ss/slideshow-best-ways-to-take-different-vitamins", image: "https://i0.wp.com/www.eatthis.com/wp-content/uploads/2018/03/woman-taking-pill-supplement-water.jpg", category:"Morning Tasks"},
  {title: "Go To The Gym to Workout", description: "40 min cardio, isolate restance training, core training ", link: "https://www.foxfitnesstx.com/", image: "https://img.etimg.com/photo/msid-74747053,quality-100/for-miles-a-great-bodyweight-workout-would-include-squats-push-ups-walking-lunges-.jpg", category:"Morning Tasks"},
  {title: "Let the Dog Out and Feed Him", description: "while my oatmeal is in the microwave take Rambo out to putty then let him eat.", link: "https://www.akc.org/expert-advice/training/ways-you-might-be-ruining-your-dogs-walk/", image: "https://dogpsychology101.com/wp-content/uploads/2019/01/golden_walking_body_image.jpg", category:"Morning Tasks"},
  {title: "Eat a Healthy Breackfast", description: "Eat Oatmeal for Breakfast everyday", link: "https://www.healthline.com/nutrition/12-best-foods-to-eat-in-morning", image: "https://images.heb.com/is/image/HEBGrocery/001771858-1?", category:"Morning Tasks"},
  {title: "Work on Coding Project", description: "Start out by setting your goals for the day.", link: "https://www.wanderlustworker.com/the-8-best-programming-habits-all-coders-should-have/", image: "https://code.energy/wp-content/uploads/coder-at-night.jpg", category:"All Day Task"},
  {title: "Eat a Healthy Lunch", description: "Your goal for the day is to take in 180 grms of protein per day.", link: "https://www.myfooddata.com/articles/foods-highest-in-protein.php", image: "https://www.myfooddata.com/images/intro/high-protein-foods.jpg", category:"Mid-Day Tasks"},
  {title: "Lay Something Out For Supper",  description: "Look at high protein recipe ideas.", link: "https://www.self.com/gallery/10-high-protein-dinners-you-can-make-in-20-minutes-or-less", image: "https://media.self.com/photos/5a3823d22323e96043af7f58/master/w_1600%2Cc_limit/High-Protein-Dinners.jpg", category:"Evening Tasks"},
  {title: "Vaccuum The  Floor", description: "Vacuum the floor after super to help burn off the calories.", link: "https://www.marthastewart.com/1109836/golden-rules-vacuuming", image: "https://1xmmzh397wwl19zunv1as9uy-wpengine.netdna-ssl.com/wp-content/uploads/2015/10/vacuum-cleaning.jpg", category:"Evening Tasks"},
  {title: "Cook a Healthy Supper", description: "Keep away efrom starches. Snack on protein bars and nuts", link: "https://www.eatthis.com/25-best-protein-snacks/", image: "https://i2.wp.com/www.eatthis.com/wp-content/uploads/media/images/ext/455614788/protein-bars-low-sugar.jpg", category:"Evening Tasks"},
  {title: "Clean The Dishes", description: "Make sure all the disshes are rinsed off and put in the dishwasher", link: "https://www.busybudgeter.com/the-easiest-routine-to-wash-dishes-never-get-behind-again/", image: "https://www.a1-cleaningservices.com/wp-content/uploads/2020/01/Dishwashing-Plates-300x195.jpg", category:"Evening Tasks"},
  {title: "Check Your Tasks to Make Sure You Have Completed Them All", description: "Check taskify to see if there are any unfinished tasks.", link: "https://www.blog.daydesigner.com/assess-your-personal-productivity/", image: "http://barbschmidt.com/wp-content/uploads/2015/02/web-2-27-15.jpg", category:"Evening Tasks"}]


tasks.each do |task|
  Task.create(task)
end
