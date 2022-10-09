<?php

namespace App\Http\Controllers\API\Tatum\VirtualAccounts;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class BCOperationController extends Controller
{
    /**
     * Send ETH from a virtual account to the blockchain
     * https://apidoc.tatum.io/tag/Blockchain-operations#operation/EthTransfer
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function EthTransfer(Request $request)
    {
        $validated_data = $request->validate([
            //'one_of' => ['required', 'string', Rule::in(['TransferEth','TransferEthMnemonic','TransferEthKMS'])],
            'address' => ['required', 'string', 'size:42'],
            'amount' => ['required', 'string', 'max:38'],
            //'index' => ['required', 'integer', 'max:2147483647'],
            'senderAccountId' => ['required', 'string', 'size:24'],
            'senderNote' => ['required', 'string', 'max:500'],
            //'privateKey' => ['required_if:one_of,=,TransferEth', 'string', 'size:66'],
            //'mnemonic' => ['required_if:one_of,=,TransferEthMnemonic', 'string', 'max:500'],
            //'signatureId' => ['required_if:one_of,=,TransferEthKMS', 'string'],
        ]);

        //$validated_data['index'] = 1;
        $validated_data['signatureId'] = env('TATUM_KMS_SIGNATURE_ID');

        $payload = $validated_data;
        
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/offchain/ethereum/transfer",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Send Ethereum ERC-20 tokens from a virtual account to the blockchain
     * https://apidoc.tatum.io/tag/Blockchain-operations#operation/EthTransferErc20
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function EthTransferErc20(Request $request)
    {
        $validated_data = $request->validate([
            //'one_of' => ['required', 'string', Rule::in(['TransferErc20','TransferErc20Mnemonic','TransferErc20KMS'])],
            'address' => ['required', 'string', 'size:42'],
            'amount' => ['required', 'string', 'max:38'],
            'currency' => ['required', 'string', 'max:30'],
            'index' => ['required', 'integer', 'max:2147483647'],
            'senderAccountId' => ['required', 'string', 'size:24'],
            'senderNote' => ['required', 'string', 'max:500'],
            //'privateKey' => ['required_if:one_of,=,TransferErc20', 'string', 'size:66'],
            //'mnemonic' => ['required_if:one_of,=,TransferErc20Mnemonic', 'string', 'max:500'],
            //'signatureId' => ['required_if:one_of,=,TransferErc20KMS', 'string'],
        ]);

        $payload = $validated_data;
        
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/offchain/ethereum/erc20/transfer",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }
}
