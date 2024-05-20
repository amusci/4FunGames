using UnityEngine.SceneManagement;
using UnityEngine;

public class FinishLineForLevel2 : MonoBehaviour
{
    AudioManager audioManager;
    private void Awake()
    {

        audioManager = GameObject.FindGameObjectWithTag("Audio").GetComponent<AudioManager>();

    }


    void OnCollisionEnter2D(Collision2D other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            audioManager.PlaySFX(audioManager.nextlevel);
            SceneManager.LoadScene("level3");
            
        }
        
    }
}
