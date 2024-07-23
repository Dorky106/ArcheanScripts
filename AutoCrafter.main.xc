include "CrafterLibrary.xc"
include "ContainerLibrary.xc"

var $CraftScreen = Screen("Display", 0) ; Craft Screen to display what item is selected, and the amount
var $SelectionScreen = Screen("Display", 2)  ; Screen for selecting what item to craft
var $ContainerAlias = "Storage"
var $CraftAlias = "Crafter"

; Text Vars
storage var $CraftList:text	; List of all the items to craft in an array-ish setup
var $CraftSelected = "" ; What item is selected from the craft list
; Number Vars
const $ArrowButtonWidth = 20 ; Width of the arrow buttons
const $ButtonHeight = 10 ; Height of the selection buttons
const $CraftAmountDefault = 20 ; Default value for CraftAmount
var $CraftAmount = 3 ; How many of selected item should be crafted
var $CategoryIndex = -1 ; Track which category is selected
var $CraftIndex = -1 ; For future use of showing the required items in a recipe
var $selectionOffset = 0 ; Track how much to shift the screen
var $SelectionSectionWidth:number 

; Color Vars
var $TextColor = color(255,255,255) ; Color used for text on the screens
var $ArrowColor = color(255,255,255) ; Color used 
var $CategoryButtonColor = color(15,15,15)
var $RecipeButtonColor = color(25,25,25)
var $BasicButtonColor = color(35,35,35)

function @CanCraft ( $Item:text, $Amount:number):number
	foreach $Categories ($a, $category)
		array $itemRecipe:text
		$itemRecipe.from(@GetRecipe($Item, $category), ",")
		foreach $itemRecipe ($k, $v)
			foreach $v ( $reqItem, $reqAmount )
				if (@IsBaseItem($reqItem) == 1) ; Check if reqItem is an ore or fluid)
					if @HaveItem ( $ContainerAlias, $reqItem ) == 1
						if @GetItemAmount ( $ContainerAlias, $reqItem ) < $reqAmount * $Amount
							$CraftList = "." & $reqItem & "{" & ($reqAmount * $Amount):text & "}"	& $CraftList
							return 0
					else
						$CraftList = "." & $reqItem & "{" & ($reqAmount * $Amount):text  & "}"	& $CraftList
						return 0
	return 1

; Initialize any code that needs to be done first.
init
	@CrafterInitialize ()
	$SelectionSectionWidth = $SelectionScreen.width - $ArrowButtonWidth - 1

function @ProcessCrafts ()
	print($CraftList)
	foreach $CraftList($k, $v)
	{
		if (@GetItemAmount($ContainerAlias, $k) >= $v)
		{
			var $index = find($CraftList, "}")+1
			$CraftList = substring($CraftList, $index, size($CraftList))
		}
		else
		{
			if (@CanCraft($k, $v - @GetItemAmount ( $ContainerAlias, $k )) == 0)
			{
				break
			}
			if (@GetCrafterProgress() != -1)
			{	
				@SetCraft ( $CraftAlias, $k)
				@StartCraft ( $CraftAlias )
			}
		}
		break
	}

; Purely for processing the crafting list at a rate of 12 attempts per second
; Any higher then 12 and you start crafting extra items
timer frequency 10
	@ProcessCrafts () 

function @UpdateCraftScreen ()
	$CraftScreen.blank()
	if $CraftSelected != ""
		$CraftScreen.Write(180/2-size(text("{} {}",$CraftSelected, $CraftAmount))*$CraftScreen.char_w/2, ($CraftScreen.height-10)/2-$CraftScreen.char_h/2, $TextColor, text("{} {}", $CraftSelected, $CraftAmount))

; Craft Buttons
	if $CraftScreen.button_rect(180,1,199,20, $BasicButtonColor, $BasicButtonColor
		$CraftAmount++
	$CraftScreen.draw_triangle(190,3,185,18,195,18,$ArrowColor, $ArrowColor)

	if $CraftScreen.button_rect(180,21,199,39, $BasicButtonColor, $BasicButtonColor
		$CraftAmount--
		if($CraftAmount < 1)
			$CraftAmount = 1
	$CraftScreen.draw_triangle(190,37,185,22,195,22,$ArrowColor, $ArrowColor)
	
	if $CraftScreen.button_rect(1,30,179,39,$BasicButtonColor,$BasicButtonColor)
		if $CraftSelected != ""
			$CraftList = "." & $CraftSelected & "{" & $CraftAmount:text & "}"	& $CraftList
			$CraftSelected = ""
			$CraftAmount = $CraftAmountDefault
			
	$CraftScreen.write(179/2-size("Craft")*$CraftScreen.char_w/2,31,$TextColor,"Craft")
	
function @UpdateSelectionScreen ()
	$SelectionScreen.blank ()
	var $selectionHeight = 0
	$SelectionScreen.draw_rect(181,0,200,74, $BasicButtonColor, $BasicButtonColor)
	if $SelectionScreen.button_triangle(190,15,185,59,195,59,$ArrowColor,$ArrowColor)
		$selectionOffset += 10
		
	if $selectionOffset > 0
		$selectionOffset = 0
		
	$SelectionScreen.draw_rect(181,76,200,150, $BasicButtonColor, $BasicButtonColor)
	if $SelectionScreen.button_triangle(190,135,185,91,195,91,$ArrowColor,$ArrowColor)
		$selectionOffset -= 10
		
	if($CategoryIndex == -1)
		$selectionOffset = 0
	foreach $Categories ($k, $v)
		if $SelectionScreen.button_rect(0,$SelectionHeight+$selectionOffset,$SelectionSectionWidth,$SelectionHeight+$selectionOffset+9,$CategoryButtonColor,$CategoryButtonColor)
			if $CategoryIndex != $k
				$CategoryIndex = $k
				$selectionOffset = 0
				$Crafts.from(@CategoryRecipes($v), ",")
			else
				$CategoryIndex = -1
		$SelectionScreen.write(2,$SelectionHeight+$selectionOffset+1,$TextColor,$v)
		$selectionHeight += 10
		if $CategoryIndex == $k
			foreach $Crafts ($l, $recipe)
				if $SelectionScreen.button_rect(0, $SelectionHeight+$selectionOffset, $SelectionSectionWidth, $SelectionHeight+$selectionOffset+9, $RecipeButtonColor, $RecipeButtonColor)
					if $CraftIndex != $l
						$CraftIndex = $l
						$CraftSelected = $recipe
					else
						$CraftIndex = -1
				$SelectionScreen.write(10,$SelectionHeight+$selectionOffset+1,$TextColor,$recipe)
				$selectionHeight += 10
update
	@UpdateCraftScreen ()
	@UpdateSelectionScreen ()
	
input.0($p:number, $craft:text)
	blank()
	write( 0, 0,blue,$CraftList)
	write( 0,10,blue,$craft)
	if $p == -1
		write( 0,20,blue,"Error")
	elseif $p == 1
		write( 0,20,blue,"Complete")
	else
		write( 0,20,blue,$p:text)