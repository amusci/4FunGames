using UnityEngine;

public class AudioManager : MonoBehaviour
{
    [Header("---------- Audio Source ----------")]
    [SerializeField] AudioSource musicSource;
    [SerializeField] AudioSource SFXsource;

    [Header("---------- Audio Clip ----------")]
    public AudioClip background;
    public AudioClip nextlevel;
    public AudioClip death;

    private static AudioManager instance;


    private void Awake()
    {
        
        if (instance == null)
        {
            instance = this;
            DontDestroyOnLoad(gameObject); // this took me 1 hour to find am i lost???
            PlayBackgroundMusic(); 
        }
        else
        {
            
            Destroy(gameObject);
        }
    }

        private void PlayBackgroundMusic()
    {
        musicSource.clip = background;
        musicSource.loop = true; 
        musicSource.Play();
    }



    public void PlaySFX(AudioClip clip)
    {

        SFXsource.PlayOneShot(clip);

    }

    public void PauseBackgroundMusic()
    {

        musicSource.Pause();

    }

    public void ResumeBackgroundMusic()
    {

        musicSource.UnPause();

    }

}

