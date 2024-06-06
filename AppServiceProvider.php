namespace App\Providers;

use App\Mail\CustomSesTransport;
use Aws\Ses\SesClient;
use Illuminate\Support\ServiceProvider;
use Swift_Mailer;
use Illuminate\Mail\MailManager;

class AppServiceProvider extends ServiceProvider
{
    public function boot()
    {
        $this->app->make(MailManager::class)->extend('ses', function ($app) {
            $config = $app['config']->get('services.ses', []);
            $client = new SesClient([
                'version' => 'latest',
                'region'  => $config['region'],
                'credentials' => [
                    'key'    => $config['key'],
                    'secret' => $config['secret'],
                ],
            ]);

            return new CustomSesTransport($client, $config['options'] ?? []);
        });
    }

    public function register()
    {
        //
    }
}
