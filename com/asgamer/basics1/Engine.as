

package com.asgamer.basics1
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event; //don't forget to make sure this is imported
	
	public class Engine extends MovieClip
	{
		
		private var numStars:int = 80;
		// we need to keep track of our enemies.
		public static var enemyList:Array = new Array();
		// moved ourShip to a class variable.
		private var ourShip:Ship;
		
		
		public function Engine() : void
		{
			//removed the var ourShip:Ship because we declared it above.
			ourShip = new Ship(stage);
			stage.addChild(ourShip);
			
			ourShip.x = stage.stageWidth / 2;
			ourShip.y = stage.stageHeight / 2;
			
			for (var i:int = 0; i < numStars; i++)
			{
				stage.addChildAt(new Star(stage), stage.getChildIndex(ourShip));
			}
			
			//running a loop now.... so we can keep creating enemies randomly.
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
			
		}
		
		//our loop function
		private function loop(e:Event) : void
		{
			//run if condition is met.
			if (Math.floor(Math.random() * 90) == 5)
			{
				//create our enemy
				var enemy:Stinger = new Stinger(stage, ourShip);
				
				//listen for enemy being removed from stage
				enemy.addEventListener(Event.REMOVED_FROM_STAGE, removeEnemy, false, 0, true);
				
				//add our enemy to the enemyList
				enemyList.push(enemy);
				
				stage.addChild(enemy);
			}
		}
		
		//run when an enemy is removed from stage
		private function removeEnemy(e:Event)
		{
			enemyList.splice(enemyList.indexOf(e.currentTarget), 1);
		}
		
	}
	
}

