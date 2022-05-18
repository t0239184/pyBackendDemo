
import json
import app


def test_index_route():
    ap = app.create_app()
    response = ap.test_client().get('/ping')
    json_obj = json.loads(response.data)
    assert response.status_code is 200
    assert json_obj['health'] is True
