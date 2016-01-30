package;

import kha.Assets;
import kha.Scheduler;
import kha.System;

class Main
{
	public function new()
	{
		System.init("EscapeBot", 800, 600, initialized);
	}

	function initialized():Void
	{
		var game = new EscapeBot();

		Assets.loadEverything(handleAssetsLoaded);

		System.notifyOnRender(game.render);
		Scheduler.addTimeTask(game.update, 0, 1 / 60);
	}

	function handleAssetsLoaded():Void
	{
	}

	public static function main()
	{
		new Main();
	}
}