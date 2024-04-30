using UnityEngine;

public class DeathScript : MonoBehaviour
{

    public GameObject start;
    public GameObject player;
    AudioManager audioManager;
    
    
    private void Awake()
    {

        audioManager = GameObject.FindGameObjectWithTag("Audio").GetComponent<AudioManager>();

    }

    void OnCollisionEnter2D(Collision2D other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            audioManager.PlaySFX(audioManager.death);
            player.transform.position = start.transform.position;

        }
    }
}
