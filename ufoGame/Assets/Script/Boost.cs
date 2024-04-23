using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Boost : MonoBehaviour
{
    private GameObject player;
    private ScoreManager scoreManager; // Declare scoreManager variable

    // Start is called before the first frame update
    void Start()
    {
        player = GameObject.FindGameObjectWithTag("Player");
        scoreManager = FindObjectOfType<ScoreManager>(); // Find the ScoreManager script in the scene
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.tag == "Border")
        {
            Destroy(gameObject);
        }
        else if (collision.tag == "Player")
        {
            if (scoreManager != null)
            {
                scoreManager.IncreaseScore(1); // Increase the score by 1
            }
            Destroy(gameObject);
        }
    }
}
