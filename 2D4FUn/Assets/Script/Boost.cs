using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Boost : MonoBehaviour
{

    private GameObject player;
    public float temporarySpeedIncrease = 5f;
    private float originalPlayerSpeed;
    private bool speedIncreased = false;
    // Start is called before the first frame update
    void Start()
    {

        player = GameObject.FindGameObjectWithTag("Player");
        
    }
    

    private void OnTriggerEnter2D(Collider2D collision)
    {

        if (collision.tag == "Border")

        {

            Destroy(this.gameObject);

        }
        else if (collision.tag == "Player")

        {
            if (!speedIncreased) 
            {

                StartCoroutine(IncreasePlayerSpeedForDuration(3f));
                speedIncreased = true;

            }

            

        }
        
    }

        IEnumerator IncreasePlayerSpeedForDuration(float duration)
    {
        // get player components
        Player playerScript = player.GetComponent<Player>();

        // Store the original player speed
        originalPlayerSpeed = playerScript.playerSpeed;

        // Increase the player speed
        playerScript.playerSpeed = temporarySpeedIncrease;

        // Wait for the specified duration
        yield return new WaitForSeconds(duration);

        // Restore the original player speed
        playerScript.playerSpeed = originalPlayerSpeed;

        // Reset speedIncreased flag
        speedIncreased = false;
    }

}
