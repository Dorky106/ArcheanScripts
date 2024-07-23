include "CrafterIO.xc"

array $Categories:text
array $Crafts:text

function @CrafterInitialize()
	$Categories.from(get_recipes_categories("crafter"), ",")

function @CategoryRecipes($Category:text):text
	return get_recipes("crafter", $Category)
	
function @GetRecipe($Item:text, $Category:text):text
	return get_recipe("crafter", $Category, $Item)
	
function @IsBaseItem($Item:text):number
	foreach $Categories ($k, $v)
		if(@GetRecipe($Item, $v) != "")
			return 1
	return 0
