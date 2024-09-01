import azure.functions as func
import datetime
import json
import logging

app = func.FunctionApp()

@app.route(route="process_payment", auth_level=func.AuthLevel.ANONYMOUS)
def process_payment(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    req_body = req.get_json()

    if req_body:
        return func.HttpResponse(f"Executed payment, {req_body}.")
    else:
        return func.HttpResponse(
             "This HTTP triggered function executed successfully. Pass a payment in the request body for a personalized response.",
             status_code=200
        )