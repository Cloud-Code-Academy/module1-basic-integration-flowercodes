public class JSONPlaceholderExercise {
  private static final String BASE_URL = 'https://jsonplaceholder.typicode.com';

  /**
   * Exercise 1: Implement a GET request to fetch a post by ID
   * Endpoint: /posts/{postId}
   * @param postId - The ID of the post to fetch
   * @return String - The JSON response from the API
   */
  public static String getPostById(Integer postId) {
    Http h = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint(BASE_URL + '/posts/' + postId);
    req.setMethod('GET');
    HttpResponse res = h.send(req);
    System.debug('Body:' + res.getBody());
    return res.getBody();
  }

  /**
   * Exercise 2: Implement a POST request to create a new post
   * Endpoint: /posts
   * @param title - The title of the post
   * @param body - The body content of the post
   * @param userId - The user ID creating the post
   * @return String - The JSON response from the API
   */
  public static String createPost(String title, String body, Integer userId) {
    Http h = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint(BASE_URL + '/posts');
    req.setMethod('POST');

    Map<String, Object> bodyMap = new Map<String, Object>();
    bodyMap.put('title', title);
    bodyMap.put('body', body);
    bodyMap.put('userId', userId);

    body = JSON.serialize(bodyMap);
    req.setBody(body);
    HttpResponse res = h.send(req);
    return res.getBody();
  }

  /**
   * Exercise 3: Implement a PUT request to update a post
   * Endpoint: /posts/{postId}
   * @param postId - The ID of the post to update
   * @param title - The new title
   * @param body - The new body content
   * @param userId - The user ID
   * @return String - The JSON response from the API
   */
  public static String updatePost(
    Integer postId,
    String title,
    String body,
    Integer userId
  ) {
    Http h = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint(BASE_URL + '/posts/' + postId);
    req.setMethod('PUT');

    Map<String, Object> bodyMap = new Map<String, Object>();
    bodyMap.put('title', title);
    bodyMap.put('body', body);
    bodyMap.put('userId', userId);

    body = JSON.serialize(bodyMap);
    req.setBody(body);
    HttpResponse res = h.send(req);
    return res.getBody();
  }

  /**
   * Exercise 4: Implement a PATCH request to partially update a post
   * Endpoint: /posts/{postId}
   * @param postId - The ID of the post to patch
   * @param title - The new title (can be null)
   * @return String - The JSON response from the API
   */
  public static String patchPostTitle(Integer postId, String title) {
    Http h = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint(BASE_URL + '/posts/' + postId);
    req.setMethod('PATCH');

    Map<String, Object> bodyMap = new Map<String, Object>();
    bodyMap.put('id', postId);
    bodyMap.put('title', title);

    String body = JSON.serialize(bodyMap);
    req.setBody(body);

    HttpResponse res = h.send(req);
    return res.getBody();
  }

  /**
   * Exercise 5: Implement a DELETE request to remove a post
   * Endpoint: /posts/{postId}
   * @param postId - The ID of the post to delete
   * @return Integer - The HTTP status code from the response
   */
  public static Integer deletePost(Integer postId) {
    Http h = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint(BASE_URL + '/posts/' + postId);
    req.setMethod('DELETE');

    Map<String, Object> bodyMap = new Map<String, Object>();
    bodyMap.put('id', postId);

    String body = JSON.serialize(bodyMap);
    req.setBody(body);

    HttpResponse res = h.send(req);
    return res.getStatusCode();
  }
}
