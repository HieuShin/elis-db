namespace App\Mail;

use Aws\Ses\SesClient;
use Illuminate\Mail\Transport\SesTransport;
use Swift_Mime_SimpleMessage;

class CustomSesTransport extends SesTransport
{
    protected $client;
    protected $options;

    public function __construct(SesClient $client, $options = [])
    {
        parent::__construct($client, $options);
        $this->client = $client;
        $this->options = $options;
    }

    protected function doSend(Swift_Mime_SimpleMessage $message)
    {
        try {
            $result = $this->client->sendRawEmail(
                [
                    'RawMessage' => [
                        'Data' => $message->toString(),
                    ],
                ] + $this->options
            );

            $message->getHeaders()->addTextHeader('X-SES-Message-ID', $result->get('MessageId'));
        } catch (\Aws\Exception\AwsException $e) {
            // Handle the 403 error specifically
            if ($e->getStatusCode() === 403) {
                // Add your custom handling for 403 errors here
                // For example, logging the error
                \Log::error('403 Error: ' . $e->getAwsErrorMessage());
                // Optionally, you can throw a different exception or return a specific response
                throw new \Swift_TransportException('Custom handling of 403 error: ' . $e->getAwsErrorMessage(), 403);
            }
            // Rethrow other exceptions
            throw $e;
        }
    }
}
