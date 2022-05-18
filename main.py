
from app import create_app

ap = create_app()

if __name__ == '__main__':
    ap.run(
        host='127.0.0.1',
        port=5000,
        debug=True)
