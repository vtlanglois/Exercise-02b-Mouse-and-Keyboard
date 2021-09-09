# Exercise-02b-Mouse-and-Keyboard

Exercise for MSCH-C220, 9 September 2021

A demonstration of this exercise is available at [https://youtu.be/wwx9TWtMoO8](https://youtu.be/wwx9TWtMoO8)

This exercise is the first opportunity for you to play with keyboard and mouse input in Godot. The project will allow you to adjust the 2D rotation and position of a Node2D using player input. 

Fork this repository. When that process has completed, make sure that the top of the repository reads [your username]/Exercise-02b-Mouse-and-Keyboard. *Edit the LICENSE and replace BL-MSCH-C220-F21 with your full name.* Commit your changes.

Press the green "Code" button and select "Open in GitHub Desktop". Allow the browser to open (or install) GitHub Desktop. Once GitHub Desktop has loaded, you should see a window labeled "Clone a Repository" asking you for a Local Path on your computer where the project should be copied. Choose a location; make sure the Local Path ends with "Exercise-02b-Mouse-and-Keyboard" and then press the "Clone" button. GitHub Desktop will now download a copy of the repository to the location you indicated.

Open Godot. In the Project Manager, tap the "Import" button. Tap "Browse" and navigate to the repository folder. Select the project.godot file and tap "Open".

You will now see a simple scene, containing a parent Node2D, a container for your ship's bullets (Weapons), and a Node2D (called Player). Player has a script attached to it (Player.gd) which doesn't do too much for now; it makes sure the player wraps around the screen (the `wrapf` statements) and calls the get_input function to see how the Player should be accelerated (0 for now). It also handles firing bullets (like we saw in Exercise 02a).

The first step, however, is to add inputs to the Input Map. In the Project menu, choose Project Settings, and select the Input Map tab. Near the top of the window is an "Action:" text box with an "Add" button next to it. Add the following inputs to the map (*case is important, so make sure these are all lower case*):

 * forward
 * back
 * left
 * right
 * menu
 * shoot

Now, scroll down in the list to see the inputs you have just added. At the right of the window on the "up" line, you should see a plus sign. Select "key". When the resulting window appears, type w and then push "OK".

Repeat the process for the rest of the inputs: forward (w), back (s), left (a), right (d), menu (esc), shoot (space). Close the window.

Next, let's add a sprite to the Player (so we can see where we are going). Right-click on the Player node (in the Scene panel) and Add Child Node. Search for Sprite. When the sprite has been added, drag the ship image from the Assets folder (in the FileSystem panel) to the Texture field in the Inspector. You should now see a ship in the middle of the window.

Now return to the Player.gd script. Starting on line 15, paste in the following code:
```
	var pos = get_viewport().get_mouse_position()
	look_at(pos)
	rotation_degrees += 90
```

Be careful to ensure that the resulting code is inserted with tabs.

This finds the current location of the mouse (and assigns it to the variable pos). It then turns the Player (Node2D) to correspond with Godot's notion of "forward" (as it might be in a 2D platformer, for example). This is 90 degrees off from what we want in this context, so we adjust its rotation by 90 degrees. This will happen during every update cycle.

Save the scene and run it. You should now be able to rotate the Player by moving the mouse around the window. You should also be able to shoot (as we implemented in the last exercise) by pushing the space bar.

Next, let's enable keyboard control. Replace the get_input function with this:

```
func get_input():
	var input_dir = Vector2(0,0)
	if Input.is_action_pressed("forward"):
		input_dir.y -= 1
	if Input.is_action_pressed("back"):
		input_dir.y += 1
	if Input.is_action_pressed("left"):
		input_dir.x -= 1
	if Input.is_action_pressed("right"):
		input_dir.x += 1
	return input_dir.rotated(rotation)
```

Be careful to ensure that the resulting code is inserted with tabs instead of spaces.

This will accelerate the Player in the direction it is facing by pushing the w key. It can be accelerated backwards or left or right using the other WASD keys.

Test it and make sure this is working correctly. The get_input function is probably a good snippet to add to your gists.

Quit Godot. In GitHub desktop, you should now see the updated files listed in the left panel. In the bottom of that panel, type a Summary message (something like "Completes the mouse and keyboard exercise") and press the "Commit to master" button. On the right side of the top, black panel, you should see a button labeled "Push origin". Press that now.

If you return to and refresh your GitHub repository page, you should now see your updated files with the time when they were changed.

Now edit the README.md file. When you have finished editing, commit your changes, and then turn in the URL of the main repository page (https://github.com/[username]/Exercise-02b-Mouse-and-Keyboard) on Canvas.

The final state of the file should be as follows (replacing my information with yours):
```
# Exercise-02b-Mouse-and-Keyboard
Exercise for MSCH-C220, 9 September 2021

A simple game exploring mouse and keyboard control of Node2D translation and rotation.

## To play
Use WASD keys to accelerate the player. The ship will always point towards the mouse.

## Implementation
Built using Godot 3.3.3

## References
None

## Future Development
None

## Created by 
Jason Francis

```
