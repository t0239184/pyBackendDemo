from flask import Flask


def create_app() -> Flask:
    app = Flask(__name__)

    @app.route('/ping', methods=['GET'])
    def ping():
        return {'health': True}

    return app
