<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

use App\Http\Controllers\API\__AuxController;

class LoadFactoryData extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'load_factory_data';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Load factory data';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $this->info("Starting load of factory data");
        (new __AuxController)->load_factory_data();
        $this->info("Factory data loaded");
        return 0;
    }
}
